//
// Created by Caelum Dudek and Chloe Zacharias on 2024-08-01.
//
#include <stdint.h>
#include <stdio.h>
#include "../CSC_global.h"
#include <arm_neon.h>
#include "implementations.h"

#define RGB_MIN 0
#define RGB_MAX 255
#define DEBUG 0

static inline void clamp_rgb(int32_t *values) {
    uint8_t i = 0;
    for (; i ^ 0x4; ++i) {
        if (values[i] < RGB_MIN) {
            values[i] = RGB_MIN;
        } else if (values[i] > RGB_MAX) {
            values[i] = RGB_MAX;
        }
    }
}

/*
 **********************************************************
 * __   _____ ___     __    ___  ___ ___
 * \ \ / / __/ __|  __\ \  | _ \/ __| _ )
 *  \ V / (_| (__  |___> > |   / (_ | _ \
 *   |_| \___\___|    /_/  |_|_\\___|___/
 *
 * YCC to RGB
 */

void CSC_YCC_to_RGB_neon(int row, int col) {

    int32_t Y_array[4] = {Y[row][col], Y[row][col + 1], Y[row + 1][col], Y[row + 1][col + 1]};
    int32_t Cb_array[4] = {Cb_temp[row][col], Cb_temp[row][col + 1], Cb_temp[row + 1][col], Cb_temp[row + 1][col + 1]};
    int32_t Cr_array[4] = {Cr_temp[row][col], Cr_temp[row][col + 1], Cr_temp[row + 1][col], Cr_temp[row + 1][col + 1]};


    // Initialization

    // 1 << 4 is cheaper than 16
    int32x4_t scaled_vector_16 = vdupq_n_s32(1 << 4);
    int32x4_t YY = vld1q_s32(Y_array);
    YY = vqsubq_s32(YY, scaled_vector_16);

    // 1 << 6 is cheaper than 128
    int32x4_t scaled_vector_128 = vdupq_n_s32(1 << 7);
    int32x4_t CbCb = vld1q_s32(Cb_array);
    CbCb = vqsubq_s32(CbCb, scaled_vector_128);

    int32x4_t CrCr = vld1q_s32(Cr_array);
    CrCr = vqsubq_s32(CrCr, scaled_vector_128);

    // Used to round up the value by 0.5 for convention when truncated
    const int32x4_t rounding = vdupq_n_s32(1 << K);

    // Red Conversion
    int32x4_t scalar_vector_D1 = vdupq_n_s32(D1);
    int32x4_t YY_scaled = vmulq_s32(YY, scalar_vector_D1);
    int32x4_t scalar_vector_D2 = vdupq_n_s32(D2);
    int32x4_t CrCr_scaled = vmulq_s32(CrCr, scalar_vector_D2);

    int32x4_t RR = vqaddq_s32(YY_scaled, CrCr_scaled);
    RR = vqaddq_s32(RR, rounding); // rounding
    RR = vshrq_n_s32(RR, K - 2); //shifting

    int32_t RR_result[4];
    vst1q_s32(RR_result, RR);

    // Assert that the values for Red are within correct bounds for safety
    clamp_rgb(RR_result);


    R[row][col] = (uint8_t) RR_result[0];
    R[row][col + 1] = (uint8_t) RR_result[1];
    R[row + 1][col] = (uint8_t) RR_result[2];
    R[row + 1][col + 1] = (uint8_t) RR_result[3];

    // Green Conversion

    int32x4_t scalar_vector_D3 = vdupq_n_s32(D3);
    CrCr_scaled = vmulq_s32(CrCr, scalar_vector_D3);

    int32x4_t scalar_vector_D4 = vdupq_n_s32(D4);
    int32x4_t CbCb_scaled = vmulq_s32(CbCb, scalar_vector_D4);

    int32x4_t GG = vqsubq_s32(YY_scaled, CrCr_scaled);
    GG = vqsubq_s32(GG, CbCb_scaled);
    GG = vqaddq_s32(GG, rounding); // rounding
    GG = vshrq_n_s32(GG, K - 2); // shifting

    int32_t GG_result[4];
    vst1q_s32(GG_result, GG);

    // Assert that the values for Green are within correct bounds for safety
    clamp_rgb(GG_result);

    G[row][col] = (uint8_t) GG_result[0];
    G[row][col + 1] = (uint8_t) GG_result[1];
    G[row + 1][col] = (uint8_t) GG_result[2];
    G[row + 1][col + 1] = (uint8_t) GG_result[3];

    // Blue Conversion

    int32x4_t scalar_vector_D5 = vdupq_n_s32(D5);
    CbCb_scaled = vmulq_s32(CbCb, scalar_vector_D5);

    int32x4_t BB = vqaddq_s32(YY_scaled, CbCb_scaled);
    BB = vqaddq_s32(BB, rounding); // rounding
    BB = vshrq_n_s32(BB, K - 2); //shifting

    int32_t BB_result[4];
    vst1q_s32(BB_result, BB);

    // Assert that the values for Blue are within correct bounds for safety
    clamp_rgb(BB_result);

    B[row][col] = (uint8_t) BB_result[0];
    B[row][col + 1] = (uint8_t) BB_result[1];
    B[row + 1][col] = (uint8_t) BB_result[2];
    B[row + 1][col + 1] = (uint8_t) BB_result[3];

#if DEBUG
    printf("YCC TO RGB\nR: %d | G: %d | B: %d",
           RR_result[0], BB_result[0], GG_result[0]);
#endif
} // END of CSC_YCC_to_RGB_neon()