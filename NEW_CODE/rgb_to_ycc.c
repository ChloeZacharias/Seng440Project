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
    uint8_t i = 0;
    for (; i ^ 0x4; ++i) {
        if (values[i] < YCC_MIN) {
            values[i] = YCC_MIN;
        } else if (values[i] > Y_MAX) {
            values[i] = Y_MAX;
        }
    }
}

static inline void clamp_crcb(uint32_t *values) {
    uint8_t i = 0;
    for (; i ^ 0x4; ++i) {
        if (values[i] < YCC_MIN) {
            values[i] = YCC_MIN;
        } else if (values[i] > CrCb_MAX) {
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

void CSC_RGB_to_YCC_neon(int row, int col) {

    uint32_t R_array[4] = {R[row][col], R[row][col + 1], R[row + 1][col], R[row + 1][col + 1]};
    uint32_t G_array[4] = {G[row][col], G[row][col + 1], G[row + 1][col], G[row + 1][col + 1]};
    uint32_t B_array[4] = {B[row][col], B[row][col + 1], B[row + 1][col], B[row + 1][col + 1]};

    // Put all the pixel values in a neon vector to make repeat calculations faster
    uint32x4_t RR = vld1q_u32(R_array);
    uint32x4_t GG = vld1q_u32(G_array);
    uint32x4_t BB = vld1q_u32(B_array);

    // Initialization of Scaled Red, Green, and Blue Arrays for Y
    uint32x4_t scalar_vector_C1 = vdupq_n_u32(C11);
    uint32x4_t RR_scaled = vmulq_u32(RR, scalar_vector_C1);
    uint32x4_t scalar_vector_C2 = vdupq_n_u32(C12);
    uint32x4_t GG_scaled = vmulq_u32(GG, scalar_vector_C2);
    uint32x4_t scalar_vector_C3 = vdupq_n_u32(C13);
    uint32x4_t BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    // Used to round up the value by 0.5 for convention when truncated
    const uint32x4_t round_up = vdupq_n_u32((1 << (K - 1)));

    // Y Conversion

    uint32x4_t YY = vqaddq_u32(RR_scaled, GG_scaled);
    YY = vqaddq_u32(YY, BB_scaled);
    YY = vqaddq_u32(YY, vdupq_n_u32((16 << K)));
    YY = vqaddq_u32(YY, round_up); //rounding

    YY = vshrq_n_u32(YY, K); //shifting
    uint32_t YY_result[4];
    vst1q_u32(YY_result, YY);

    // Assert that the values for Y are within correct bounds for safety
    clamp_y(YY_result);

    // Store results
    Y[row][col] = (uint8_t) YY_result[0];
    Y[row][col + 1] = (uint8_t) YY_result[1];
    Y[row + 1][col] = (uint8_t) YY_result[2];
    Y[row + 1][col + 1] = (uint8_t) YY_result[3];


    // Initialization of Scaled Red, Green, and Blue Arrays for Cb
    scalar_vector_C1 = vdupq_n_u32(C21);
    RR_scaled = vmulq_u32(RR, scalar_vector_C1);
    scalar_vector_C2 = vdupq_n_u32(C22);
    GG_scaled = vmulq_u32(GG, scalar_vector_C2);
    scalar_vector_C3 = vdupq_n_u32(C23);
    BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    //  Cb Conversion

    uint32x4_t add_128 = vdupq_n_u32((128 << K));

    uint32x4_t CbCb = vqaddq_u32(add_128, BB_scaled);
    CbCb = vqsubq_u32(CbCb, RR_scaled);
    CbCb = vqsubq_u32(CbCb, GG_scaled);
    CbCb = vqaddq_u32(CbCb, round_up); // rounding by adding .5
    CbCb = vshrq_n_u32(CbCb, K); //shifting

    uint32_t CbCb_result[4];
    vst1q_u32(CbCb_result, CbCb);

    // Assert that the values for Cb are within correct bounds for safety
    clamp_crcb(CbCb_result);


    // Initialization of Scaled Red, Green, and Blue Arrays for Cr
    scalar_vector_C1 = vdupq_n_u32(C31);
    RR_scaled = vmulq_u32(RR, scalar_vector_C1);
    scalar_vector_C2 = vdupq_n_u32(C32);
    GG_scaled = vmulq_u32(GG, scalar_vector_C2);
    scalar_vector_C3 = vdupq_n_u32(C33);
    BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    // Cr Conversion

    uint32x4_t CrCr = vqaddq_u32(add_128, RR_scaled);
    CrCr = vqaddq_u32(CrCr, round_up); // rounding up, done early to prevent negatives
    CrCr = vqsubq_u32(CrCr, GG_scaled);
    CrCr = vqsubq_u32(CrCr, BB_scaled);
    CrCr = vshrq_n_u32(CrCr, K); // Shifting

    uint32_t CrCr_result[4];
    vst1q_u32(CrCr_result, CrCr);

    // Assert that the values for Cr are within correct bounds for safety
    clamp_crcb(CrCr_result);

    // Pick one pixel down sampling
    Cr[row >> 1][col >> 1] = (uint8_t) CrCr_result[0];
    Cb[row >> 1][col >> 1] = (uint8_t) CbCb_result[0];

#if DEBUG
    printf("RGB TO YCC\nY: %d | Cr: %d | Cb: %d",
           YY_result[0], CrCr_result[0], CbCb_result[0]);
#endif
} // END of CSC_RGB_to_YCC_neon()