// Copyright 2023 Mihai SIMA (mihai.sima@ieee.org).  All rights reserved.
// Color Space Conversion (CSC) in fixed-point arithmetic
// RGB to YCC conversion

#include <stdint.h>
#include <stddef.h>
#include "CSC_global.h"
#include "NEW_CODE/implementations.h"

#define Y_MAX 235
#define CrCb_MAX 240
#define YCC_MIN 16

// private data

// private prototypes
// =======
static void CSC_RGB_to_YCC_brute_force_float(int row, int col);

// =======
static void CSC_RGB_to_YCC_brute_force_int(int row, int col);


// private definitions
// =======
static void CSC_RGB_to_YCC_brute_force_float(int row, int col) {
//
    uint8_t Cb_pixel_00;
    uint8_t Cb_pixel_01;
    uint8_t Cb_pixel_10;
    uint8_t Cb_pixel_11;
    uint8_t Cr_pixel_00;
    uint8_t Cr_pixel_01;
    uint8_t Cr_pixel_10;
    uint8_t Cr_pixel_11;

    Y[row + 0][col + 0] = (uint8_t) (16.0 + 0.257 * R[row + 0][col + 0]
                                     + 0.504 * G[row + 0][col + 0]
                                     + 0.098 * B[row + 0][col + 0]);
    Y[row + 0][col + 1] = (uint8_t) (16.0 + 0.257 * R[row + 0][col + 1]
                                     + 0.504 * G[row + 0][col + 1]
                                     + 0.098 * B[row + 0][col + 1]);
    Y[row + 1][col + 0] = (uint8_t) (16.0 + 0.257 * R[row + 1][col + 0]
                                     + 0.504 * G[row + 1][col + 0]
                                     + 0.098 * B[row + 1][col + 0]);
    Y[row + 1][col + 1] = (uint8_t) (16.0 + 0.257 * R[row + 1][col + 1]
                                     + 0.504 * G[row + 1][col + 1]
                                     + 0.098 * B[row + 1][col + 1]);

    Cb_pixel_00 = (uint8_t) (128.0 - 0.148 * R[row + 0][col + 0]
                             - 0.291 * G[row + 0][col + 0]
                             + 0.439 * B[row + 0][col + 0]);
    Cb_pixel_01 = (uint8_t) (128.0 - 0.148 * R[row + 0][col + 1]
                             - 0.291 * G[row + 0][col + 1]
                             + 0.439 * B[row + 0][col + 1]);
    Cb_pixel_10 = (uint8_t) (128.0 - 0.148 * R[row + 1][col + 0]
                             - 0.291 * G[row + 1][col + 0]
                             + 0.439 * B[row + 1][col + 0]);
    Cb_pixel_11 = (uint8_t) (128.0 - 0.148 * R[row + 1][col + 1]
                             - 0.291 * G[row + 1][col + 1]
                             + 0.439 * B[row + 1][col + 1]);

    Cr_pixel_00 = (uint8_t) (128.0 + 0.439 * R[row + 0][col + 0]
                             - 0.368 * G[row + 0][col + 0]
                             - 0.071 * B[row + 0][col + 0]);
    Cr_pixel_01 = (uint8_t) (128.0 + 0.439 * R[row + 0][col + 1]
                             - 0.368 * G[row + 0][col + 1]
                             - 0.071 * B[row + 0][col + 1]);
    Cr_pixel_10 = (uint8_t) (128.0 + 0.439 * R[row + 1][col + 0]
                             - 0.368 * G[row + 1][col + 0]
                             - 0.071 * B[row + 1][col + 0]);
    Cr_pixel_11 = (uint8_t) (128.0 + 0.439 * R[row + 1][col + 1]
                             - 0.368 * G[row + 1][col + 1]
                             - 0.071 * B[row + 1][col + 1]);

    Cb[row >> 1][col >> 1] = Cb_pixel_00;


    Cr[row >> 1][col >> 1] = Cr_pixel_00;

} // END of CSC_RGB_to_YCC_brute_force_float()

// =======
static void CSC_RGB_to_YCC_brute_force_int(int row, int col) {
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

    R_pixel_00 = (int) R[row + 0][col + 0];
    R_pixel_01 = (int) R[row + 0][col + 1];
    R_pixel_10 = (int) R[row + 1][col + 0];
    R_pixel_11 = (int) R[row + 1][col + 1];

    G_pixel_00 = (int) G[row + 0][col + 0];
    G_pixel_01 = (int) G[row + 0][col + 1];
    G_pixel_10 = (int) G[row + 1][col + 0];
    G_pixel_11 = (int) G[row + 1][col + 1];

    B_pixel_00 = (int) B[row + 0][col + 0];
    B_pixel_01 = (int) B[row + 0][col + 1];
    B_pixel_10 = (int) B[row + 1][col + 0];
    B_pixel_11 = (int) B[row + 1][col + 1];

    Y_pixel_00 = (16 << (K)) + C11 * R_pixel_00
                 + C12 * G_pixel_00
                 + C13 * B_pixel_00;
    Y_pixel_00 += (1 << (K - 1)); // rounding
    Y_pixel_00 = Y_pixel_00 >> K;

    Y_pixel_01 = (16 << (K)) + C11 * R_pixel_01
                 + C12 * G_pixel_01
                 + C13 * B_pixel_01;
    Y_pixel_01 += (1 << (K - 1)); // rounding
    Y_pixel_01 = Y_pixel_01 >> K;

    Y_pixel_10 = (16 << (K)) + C11 * R_pixel_10
                 + C12 * G_pixel_10
                 + C13 * B_pixel_10;
    Y_pixel_10 += (1 << (K - 1)); // rounding
    Y_pixel_10 = Y_pixel_10 >> K;

    Y_pixel_11 = (16 << (K)) + C11 * R_pixel_11
                 + C12 * G_pixel_11
                 + C13 * B_pixel_11;
    Y_pixel_11 += (1 << (K - 1)); // rounding
    Y_pixel_11 = Y_pixel_11 >> K;

    //printf("YY %u, %u\n", Y_pixel_00, (uint8_t)Y_pixel_00);


    Y[row + 0][col + 0] = (uint8_t) Y_pixel_00;
    Y[row + 0][col + 1] = (uint8_t) Y_pixel_01;
    Y[row + 1][col + 0] = (uint8_t) Y_pixel_10;
    Y[row + 1][col + 1] = (uint8_t) Y_pixel_11;

    Cb_pixel_00 = (128 << (K)) - C21 * R_pixel_00
                  - C22 * G_pixel_00
                  + C23 * B_pixel_00;
    Cb_pixel_00 += (1 << (K - 1)); // rounding
    Cb_pixel_00 = Cb_pixel_00 >> K;

    //printf("Cb %u, %u\n", Cb_pixel_00, (uint8_t)Cb_pixel_00);

    Cb_pixel_01 = (128 << (K)) - C21 * R_pixel_01
                  - C22 * G_pixel_01
                  + C23 * B_pixel_01;
    Cb_pixel_01 += (1 << (K - 1)); // rounding
    Cb_pixel_01 = Cb_pixel_01 >> K;

    Cb_pixel_10 = (128 << (K)) - C21 * R_pixel_10
                  - C22 * G_pixel_10
                  + C23 * B_pixel_10;
    Cb_pixel_10 += (1 << (K - 1)); // rounding
    Cb_pixel_10 = Cb_pixel_10 >> K;

    Cb_pixel_11 = (128 << (K)) - C21 * R_pixel_11
                  - C22 * G_pixel_11
                  + C23 * B_pixel_11;
    Cb_pixel_11 += (1 << (K - 1)); // rounding
    Cb_pixel_11 = Cb_pixel_11 >> K;

    Cr_pixel_00 = (128 << (K)) + C31 * R_pixel_00
                  - C32 * G_pixel_00
                  - C33 * B_pixel_00;
    Cr_pixel_00 += (1 << (K - 1)); // rounding
    Cr_pixel_00 = Cr_pixel_00 >> K;

    //printf("Cr %u, %u\n", Cr_pixel_00, (uint8_t)Cr_pixel_00);

    Cr_pixel_01 = (128 << (K)) + C31 * R_pixel_01
                  - C32 * G_pixel_01
                  - C33 * B_pixel_01;
    Cr_pixel_01 += (1 << (K - 1)); // rounding
    Cr_pixel_01 = Cr_pixel_01 >> K;

    Cr_pixel_10 = (128 << (K)) + C31 * R_pixel_10
                  - C32 * G_pixel_10
                  - C33 * B_pixel_10;
    Cr_pixel_10 += (1 << (K - 1)); // rounding
    Cr_pixel_10 = Cr_pixel_10 >> K;

    Cr_pixel_11 = (128 << (K)) + C31 * R_pixel_11
                  - C32 * G_pixel_11
                  - C33 * B_pixel_11;
    Cr_pixel_11 += (1 << (K - 1)); // rounding
    Cr_pixel_11 = Cr_pixel_11 >> K;

    Cb[row >> 1][col >> 1] = (uint8_t) Cb_pixel_00;

    Cr[row >> 1][col >> 1] = (uint8_t) Cr_pixel_00;

} // END of CSC_RGB_to_YCC_brute_force_int()


// =======
void CSC_RGB_to_YCC(void) {
    for (int row = 0; row < IMAGE_ROW_SIZE; row += 2) {
        for (int col = 0; col < IMAGE_COL_SIZE; col += 2) {
            switch (RGB_to_YCC_ROUTINE) {
                case 0:
                break;
                case 1:
                    CSC_RGB_to_YCC_brute_force_float(row, col);
                break;
                case 2:
                    CSC_RGB_to_YCC_brute_force_int(row, col);
                break;
                case 3:
                    CSC_RGB_to_YCC_neon(row, col);
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

} // END of CSC_RGB_to_YCC()

