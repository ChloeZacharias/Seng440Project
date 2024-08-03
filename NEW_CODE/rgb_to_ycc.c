//
// Created by Caelum Dudek and Chloe Zacharias on 2024-08-01.
//
#include <stdint.h>
#include <stdio.h>
#include "../CSC_global.h"
#include <arm_neon.h>
#include "implementations.h"


#define Y_MAX 235
#define CrCb_MAX 240
#define YCC_MIN 16
#define DEBUG 0

static inline void clamp_y(uint32_t *values) {
    register int8_t i = 3;
    for (; i>=0; --i){
        if (values[i] < YCC_MIN) {
            values[i] = YCC_MIN;
        }
        if (values[i] > Y_MAX) {
            values[i] = Y_MAX;
        }
    }
}

static inline void clamp_crcb(uint32_t *values) {
    register int8_t i = 3;
    for (; i>=0; --i){
        if (values[i] < YCC_MIN) {
            values[i] = YCC_MIN;
        }
        if (values[i] > CrCb_MAX)  {
            values[i] = CrCb_MAX;
        }
    }
}



/*
 **********************************************************
 *  ___  ___ ___     __   __   _____ ___
 * | _ \/ __| _ )  __\ \  \ \ / / __/ __|
 * |   / (_ | _ \ |___> >  \ V / (_| (__
 * |_|_\\___|___/    /_/    |_| \___\___|
 *
 * RGB to YCC
 */

void CSC_RGB_to_YCC_neon( int row, int col) {
//
    uint32_t R_array[4] = {R[row][col], R[row][col+1], R[row+1][col], R[row+1][col+1]};
    uint32_t G_array[4] = {G[row][col], G[row][col+1], G[row+1][col], G[row+1][col+1]};
    uint32_t B_array[4] = {B[row][col], B[row][col+1], B[row+1][col], B[row+1][col+1]};

    // Put all the pixel values in a neon vector to make repeat calculations faster
    uint32x4_t RR = vld1q_u32 (R_array);
    uint32x4_t GG = vld1q_u32 (G_array);
    uint32x4_t BB = vld1q_u32 (B_array);

    uint32x4_t scalar_vector_C1 = vdupq_n_u32(C11);
    uint32x4_t RR_scaled = vmulq_u32(RR, scalar_vector_C1);

    uint32x4_t scalar_vector_C2 = vdupq_n_u32(C12);
    uint32x4_t GG_scaled = vmulq_u32(GG, scalar_vector_C2);

    uint32x4_t scalar_vector_C3 = vdupq_n_u32(C13);
    uint32x4_t BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    uint32x4_t YY = vqaddq_u32(RR_scaled, GG_scaled);

    YY = vqaddq_u32(YY, BB_scaled);

    uint32x4_t add_valueY = vdupq_n_u32((16 << K));
    uint32x4_t scale = vdupq_n_u32((1 << (K-1)));
    YY = vqaddq_u32(YY, add_valueY);
    YY = vqaddq_u32(YY, scale); //rounding

    YY = vshrq_n_u32(YY, K); //shifting
    uint32_t YY_result[4];
    vst1q_u32(YY_result, YY);

    clamp_y(YY_result);

    Y[row][col] = (uint8_t)YY_result[0];
    Y[row][col+1] = (uint8_t)YY_result[1];
    Y[row+1][col] = (uint8_t)YY_result[2];
    Y[row+1][col+1] = (uint8_t)YY_result[3];


    // GETTING THE Cb VALUES
    scalar_vector_C1 = vdupq_n_u32(C21);
    RR_scaled = vmulq_u32(RR, scalar_vector_C1);

    scalar_vector_C2 = vdupq_n_u32(C22);
    GG_scaled = vmulq_u32(GG, scalar_vector_C2);

    scalar_vector_C3 = vdupq_n_u32(C23);
    BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    uint32x4_t add_valueC = vdupq_n_u32((128 << K));


    uint32x4_t CbCb = vqaddq_u32(add_valueC, BB_scaled);
    CbCb = vqsubq_u32(CbCb, RR_scaled);
    CbCb = vqsubq_u32(CbCb, GG_scaled);

    CbCb = vqaddq_u32(CbCb, scale); // rounding
    CbCb = vshrq_n_u32(CbCb, K); //shifting

    uint32_t CbCb_result[4];
    vst1q_u32(CbCb_result, CbCb);

    clamp_crcb(CbCb_result);


    scalar_vector_C1 = vdupq_n_u32(C31);
    RR_scaled = vmulq_u32(RR, scalar_vector_C1);

    scalar_vector_C2 = vdupq_n_u32(C32);
    GG_scaled = vmulq_u32(GG, scalar_vector_C2);

    scalar_vector_C3 = vdupq_n_u32(C33);
    BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    uint32x4_t CrCr = vqaddq_u32(add_valueC, RR_scaled);

    CrCr = vqaddq_u32(CrCr, scale); // rounding

    CrCr = vqsubq_u32(CrCr, GG_scaled);

    CrCr = vqsubq_u32(CrCr, BB_scaled);

    CrCr = vshrq_n_u32(CrCr, K); // Shifting

    uint32_t CrCr_result[4];

    vst1q_u32( CrCr_result, CrCr);

    clamp_crcb(CrCr_result);

    // Pick one downsampling
    Cr[row>>1][col>>1] = (uint8_t)CrCr_result[0];

    Cb[row>>1][col>>1] = (uint8_t)CbCb_result[0];

    if (DEBUG) {
        printf("RGB TO YCC\nY: %d | Cr: %d | Cb: %d", YY_result[0], CrCr_result[0], CbCb_result[0]);
    }

}