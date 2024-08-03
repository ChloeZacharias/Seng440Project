// Copyright 2023 Mihai SIMA (mihai.sima@ieee.org).  All rights reserved.
// Color Space Conversion (CSC) in fixed-point arithmetic
// YCC to RGB conversion

#include <stdio.h>
#include <stdint.h>
#include "CSC_global.h"
#include "NEW_CODE/implementations.h"
// private data

// private prototypes
// =======
static uint8_t saturation_float(float argument);

static void CSC_YCC_to_RGB_brute_force_float(int row, int col);

// =======
static uint8_t saturation_int(int argument);

static void CSC_YCC_to_RGB_brute_force_int(int row, int col);

// private definitions
// =======
static uint8_t saturation_float(float argument) {
    if (argument > 255.0) { // saturation
        return ((uint8_t) 255);
    } else if (argument < 0.0) {
        return ((uint8_t) 0);
    } else {
        return ((uint8_t) argument);
    }
} // END of saturation_float()

// =======
static void CSC_YCC_to_RGB_brute_force_float(int row, int col) {
//
    float R_pixel_00;
    float R_pixel_01;
    float R_pixel_10;
    float R_pixel_11;
    float G_pixel_00;
    float G_pixel_01;
    float G_pixel_10;
    float G_pixel_11;
    float B_pixel_00;
    float B_pixel_01;
    float B_pixel_10;
    float B_pixel_11;

    R_pixel_00 = 1.164f * (Y[row + 0][col + 0] - 16.0f)
                 + 1.596f * (Cr_temp[row + 0][col + 0] - 128.0f);
    R[row + 0][col + 0] = saturation_float(R_pixel_00);

    R_pixel_01 = 1.164f * (Y[row + 0][col + 1] - 16.0f)
                 + 1.596f * (Cr_temp[row + 0][col + 1] - 128.0f);
    R[row + 0][col + 1] = saturation_float(R_pixel_01);

    R_pixel_10 = 1.164f * (Y[row + 1][col + 0] - 16.0f)
                 + 1.596f * (Cr_temp[row + 1][col + 0] - 128.0f);
    R[row + 1][col + 0] = saturation_float(R_pixel_10);

    R_pixel_11 = 1.164f * (Y[row + 1][col + 1] - 16.0f)
                 + 1.596f * (Cr_temp[row + 1][col + 1] - 128.0f);
    R[row + 1][col + 1] = saturation_float(R_pixel_11);

    G_pixel_00 = 1.164f * (Y[row + 0][col + 0] - 16.0f)
                 - 0.813f * (Cr_temp[row + 0][col + 0] - 128.0f)
                 - 0.391f * (Cb_temp[row + 0][col + 0] - 128.0f);
    G[row + 0][col + 0] = saturation_float(G_pixel_00);

    G_pixel_01 = 1.164f * (Y[row + 0][col + 1] - 16.0f)
                 - 0.813f * (Cr_temp[row + 0][col + 1] - 128.0f)
                 - 0.391f * (Cb_temp[row + 0][col + 1] - 128.0f);
    G[row + 0][col + 1] = saturation_float(G_pixel_01);

    G_pixel_10 = 1.164f * (Y[row + 1][col + 0] - 16.0f)
                 - 0.813f * (Cr_temp[row + 1][col + 0] - 128.0f)
                 - 0.391f * (Cb_temp[row + 1][col + 0] - 128.0f);
    G[row + 1][col + 0] = saturation_float(G_pixel_10);

    G_pixel_11 = 1.164f * (Y[row + 1][col + 1] - 16.0f)
                 - 0.813f * (Cr_temp[row + 1][col + 1] - 128.0f)
                 - 0.391f * (Cb_temp[row + 1][col + 1] - 128.0f);
    G[row + 1][col + 1] = saturation_float(G_pixel_11);

    B_pixel_00 = 1.164f * (Y[row + 0][col + 0] - 16.0f)
                 + 2.018f * (Cb_temp[row + 0][col + 0] - 128.0f);
    B[row + 0][col + 0] = saturation_float(B_pixel_00);

    B_pixel_01 = 1.164f * (Y[row + 0][col + 1] - 16.0f)
                 + 2.018f * (Cb_temp[row + 0][col + 1] - 128.0f);
    B[row + 0][col + 1] = saturation_float(B_pixel_01);

    B_pixel_10 = 1.164f * (Y[row + 1][col + 0] - 16.0f)
                 + 2.018f * (Cb_temp[row + 1][col + 0] - 128.0f);
    B[row + 1][col + 0] = saturation_float(B_pixel_10);

    B_pixel_11 = 1.164f * (Y[row + 1][col + 1] - 16.0f)
                 + 2.018f * (Cb_temp[row + 1][col + 1] - 128.0f);
    B[row + 1][col + 1] = saturation_float(B_pixel_11);
} // END of CSC_YCC_to_RGB_brute_force_float()


// =======
static void CSC_YCC_to_RGB_brute_force_int(int row, int col) {
//
    int R_pixel_00;
    int R_pixel_01;
    int R_pixel_10;
    int R_pixel_11;
    int G_pixel_00;
    int G_pixel_01;
    int G_pixel_10;
    int G_pixel_11;
    int B_pixel_00;
    int B_pixel_01;
    int B_pixel_10;
    int B_pixel_11;

    int Y_pixel_00;
    int Y_pixel_01;
    int Y_pixel_10;
    int Y_pixel_11;
    int Cb_pixel_00;
    int Cb_pixel_01;
    int Cb_pixel_10;
    int Cb_pixel_11;
    int Cr_pixel_00;
    int Cr_pixel_01;
    int Cr_pixel_10;
    int Cr_pixel_11;

    Y_pixel_00 = (int) Y[row + 0][col + 0];
    Y_pixel_01 = (int) Y[row + 0][col + 1];
    Y_pixel_10 = (int) Y[row + 1][col + 0];
    Y_pixel_11 = (int) Y[row + 1][col + 1];

    Cb_pixel_00 = (int) Cb_temp[row + 0][col + 0];
    Cb_pixel_01 = (int) Cb_temp[row + 0][col + 1];
    Cb_pixel_10 = (int) Cb_temp[row + 1][col + 0];
    Cb_pixel_11 = (int) Cb_temp[row + 1][col + 1];

    Cr_pixel_00 = (int) Cr_temp[row + 0][col + 0];
    Cr_pixel_01 = (int) Cr_temp[row + 0][col + 1];
    Cr_pixel_10 = (int) Cr_temp[row + 1][col + 0];
    Cr_pixel_11 = (int) Cr_temp[row + 1][col + 1];

    Y_pixel_00 = Y_pixel_00 - 16;
    Y_pixel_01 = Y_pixel_01 - 16;
    Y_pixel_10 = Y_pixel_10 - 16;
    Y_pixel_11 = Y_pixel_11 - 16;

    Cb_pixel_00 = Cb_pixel_00 - 128;
    Cb_pixel_01 = Cb_pixel_01 - 128;
    Cb_pixel_10 = Cb_pixel_10 - 128;
    Cb_pixel_11 = Cb_pixel_11 - 128;

    Cr_pixel_00 = Cr_pixel_00 - 128;
    Cr_pixel_01 = Cr_pixel_01 - 128;
    Cr_pixel_10 = Cr_pixel_10 - 128;
    Cr_pixel_11 = Cr_pixel_11 - 128;

    R_pixel_00 = D1 * Y_pixel_00 + D2 * Cr_pixel_00;
    R_pixel_00 += (1 << (K - 1)); // rounding
    R_pixel_00 = R_pixel_00 >> K;

    R_pixel_01 = D1 * Y_pixel_01 + D2 * Cr_pixel_01;
    R_pixel_01 += (1 << (K - 1)); // rounding
    R_pixel_01 = R_pixel_01 >> K;

    R_pixel_10 = D1 * Y_pixel_10 + D2 * Cr_pixel_10;
    R_pixel_10 += (1 << (K - 1)); // rounding
    R_pixel_10 = R_pixel_10 >> K;

    R_pixel_11 = D1 * Y_pixel_11 + D2 * Cr_pixel_11;
    R_pixel_11 += (1 << (K - 1)); // rounding
    R_pixel_11 = R_pixel_11 >> K;

    R[row + 0][col + 0] = (uint8_t) R_pixel_00;
    R[row + 0][col + 1] = (uint8_t) R_pixel_01;
    R[row + 1][col + 0] = (uint8_t) R_pixel_10;
    R[row + 1][col + 1] = (uint8_t) R_pixel_11;

    //printf("RR %u, %u\n", R_pixel_00, (uint8_t)R_pixel_00);

    G_pixel_00 = D1 * Y_pixel_00 - D3 * Cr_pixel_00
                 - D4 * Cb_pixel_00;
    //printf("GG %u, %u\n", G_pixel_00, (uint8_t)G_pixel_00);
    G_pixel_00 += (1 << (K - 1)); // rounding
    //printf("GG %u, %u\n", G_pixel_00, (uint8_t)G_pixel_00);
    G_pixel_00 = G_pixel_00 >> K;

    G_pixel_01 = D1 * Y_pixel_01 - D3 * Cr_pixel_01
                 - D4 * Cb_pixel_01;
    G_pixel_01 += (1 << (K - 1)); // rounding
    G_pixel_01 = G_pixel_01 >> K;

    G_pixel_10 = D1 * Y_pixel_10 - D3 * Cr_pixel_10
                 - D4 * Cb_pixel_10;
    G_pixel_10 += (1 << (K - 1)); // rounding
    G_pixel_10 = G_pixel_10 >> K;

    G_pixel_11 = D1 * Y_pixel_11 - D3 * Cr_pixel_11
                 - D4 * Cb_pixel_11;

    G_pixel_11 += (1 << (K - 1)); // rounding
    G_pixel_11 = G_pixel_11 >> K;

    G[row + 0][col + 0] = (uint8_t) G_pixel_00;
    G[row + 0][col + 1] = (uint8_t) G_pixel_01;
    G[row + 1][col + 0] = (uint8_t) G_pixel_10;
    G[row + 1][col + 1] = (uint8_t) G_pixel_11;

    B_pixel_00 = D1 * Y_pixel_00 + D5 * Cb_pixel_00;
    B_pixel_00 += (1 << (K - 1)); // rounding
    B_pixel_00 = B_pixel_00 >> K;

    B_pixel_01 = D1 * Y_pixel_01 + D5 * Cb_pixel_01;
    B_pixel_01 += (1 << (K - 1)); // rounding
    B_pixel_01 = B_pixel_01 >> K;

    B_pixel_10 = D1 * Y_pixel_10 + D5 * Cb_pixel_10;
    B_pixel_10 += (1 << (K - 1)); // rounding
    B_pixel_10 = B_pixel_10 >> K;

    B_pixel_11 = D1 * Y_pixel_11 + D5 * Cb_pixel_11;
    B_pixel_11 += (1 << (K - 1)); // rounding
    B_pixel_11 = B_pixel_11 >> K;

    B[row + 0][col + 0] = (uint8_t) B_pixel_00;
    B[row + 0][col + 1] = (uint8_t) B_pixel_01;
    B[row + 1][col + 0] = (uint8_t) B_pixel_10;
    B[row + 1][col + 1] = (uint8_t) B_pixel_11;

    //printf("BB %u, %u\n", B_pixel_00, (uint8_t)B_pixel_00);

} // END of CSC_YCC_to_RGB_brute_force_int()


// =======
void CSC_YCC_to_RGB(void) {
    chrominance_up_sample();
    for (size_t row = 0; row < IMAGE_ROW_SIZE; row += 2) {
        for (size_t col = 0; col < IMAGE_COL_SIZE; col += 2) {
            //printf( "\n[row,col] = [%02i,%02i]\n\n", row, col);
            switch (YCC_to_RGB_ROUTINE) {
                case 0:
                break;
                case 1:
                    CSC_YCC_to_RGB_brute_force_float(row, col);
                break;
                case 2:
                    CSC_YCC_to_RGB_brute_force_int(row, col);
                break;
                case 3:
                    CSC_YCC_to_RGB_neon(row, col);
                break;
                default:
                break;
            }
//      printf( "Luma_00  = %02hhx\n", Y[row+0][col+0]);
//      printf( "Luma_01  = %02hhx\n", Y[row+0][col+1]);
//      printf( "Luma_10  = %02hhx\n", Y[row+1][col+0]);
//      printf( "Luma_11  = %02hhx\n\n", Y[row+1][col+1]);
        }
    }

} // END of CSC_YCC_to_RGB()

