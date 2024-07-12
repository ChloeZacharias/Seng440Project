// Copyright 2023 Mihai SIMA (mihai.sima@ieee.org).  All rights reserved.
// Color Space Conversion (CSC) in fixed-point arithmetic
// RGB to YCC conversion

//#include <stdio.h>
#include <stdint.h>
#include <stdio.h>
#include "CSC_global.h"
#include <arm_neon.h>

// private data

// private prototypes
// =======
static void CSC_RGB_to_YCC_brute_force_float( int row, int col);

// =======
static void CSC_RGB_to_YCC_brute_force_int( int row, int col);

// =======
static uint8_t chrominance_downsample(
    uint8_t C_pixel_1, uint8_t C_pixel_2,
    uint8_t C_pixel_3, uint8_t C_pixel_4);

// private definitions
// =======
static void CSC_RGB_to_YCC_brute_force_float( int row, int col) {
//
  uint8_t Cb_pixel_00, Cb_pixel_01;
  uint8_t Cb_pixel_10, Cb_pixel_11;
  uint8_t Cr_pixel_00, Cr_pixel_01;
  uint8_t Cr_pixel_10, Cr_pixel_11;

  Y[row+0][col+0] = (uint8_t)(16.0 + 0.257*R[row+0][col+0]
                                   + 0.504*G[row+0][col+0]
                                   + 0.098*B[row+0][col+0]);
  Y[row+0][col+1] = (uint8_t)(16.0 + 0.257*R[row+0][col+1]
                                   + 0.504*G[row+0][col+1]
                                   + 0.098*B[row+0][col+1]);
  Y[row+1][col+0] = (uint8_t)(16.0 + 0.257*R[row+1][col+0]
                                   + 0.504*G[row+1][col+0]
                                   + 0.098*B[row+1][col+0]);
  Y[row+1][col+1] = (uint8_t)(16.0 + 0.257*R[row+1][col+1]
                                   + 0.504*G[row+1][col+1]
                                   + 0.098*B[row+1][col+1]);

  Cb_pixel_00 = (uint8_t)(128.0 - 0.148*R[row+0][col+0]
                                - 0.291*G[row+0][col+0]
                                + 0.439*B[row+0][col+0]);
  Cb_pixel_01 = (uint8_t)(128.0 - 0.148*R[row+0][col+1]
                                - 0.291*G[row+0][col+1]
                                + 0.439*B[row+0][col+1]);
  Cb_pixel_10 = (uint8_t)(128.0 - 0.148*R[row+1][col+0]
                                - 0.291*G[row+1][col+0]
                                + 0.439*B[row+1][col+0]);
  Cb_pixel_11 = (uint8_t)(128.0 - 0.148*R[row+1][col+1]
                                - 0.291*G[row+1][col+1]
                                + 0.439*B[row+1][col+1]);

  Cr_pixel_00 = (uint8_t)(128.0 + 0.439*R[row+0][col+0]
                                - 0.368*G[row+0][col+0]
                                - 0.071*B[row+0][col+0]);
  Cr_pixel_01 = (uint8_t)(128.0 + 0.439*R[row+0][col+1]
                                - 0.368*G[row+0][col+1]
                                - 0.071*B[row+0][col+1]);
  Cr_pixel_10 = (uint8_t)(128.0 + 0.439*R[row+1][col+0]
                                - 0.368*G[row+1][col+0]
                                - 0.071*B[row+1][col+0]);
  Cr_pixel_11 = (uint8_t)(128.0 + 0.439*R[row+1][col+1]
                                - 0.368*G[row+1][col+1]
                                - 0.071*B[row+1][col+1]);

  Cb[row>>1][col>>1] = chrominance_downsample( Cb_pixel_00,
                                               Cb_pixel_01,
                                               Cb_pixel_10,
                                               Cb_pixel_11);

  Cr[row>>1][col>>1] = chrominance_downsample( Cr_pixel_00,
                                               Cr_pixel_01,
                                               Cr_pixel_10,
                                               Cr_pixel_11);
} // END of CSC_RGB_to_YCC_brute_force_float()

// =======
static void CSC_RGB_to_YCC_brute_force_int( int row, int col) {
//
  int R_pixel_00, R_pixel_01, R_pixel_10, R_pixel_11;
  int G_pixel_00, G_pixel_01, G_pixel_10, G_pixel_11;
  int B_pixel_00, B_pixel_01, B_pixel_10, B_pixel_11;

  int  Y_pixel_00,  Y_pixel_01,  Y_pixel_10,  Y_pixel_11;
  int Cb_pixel_00, Cb_pixel_01, Cb_pixel_10, Cb_pixel_11;
  int Cr_pixel_00, Cr_pixel_01, Cr_pixel_10, Cr_pixel_11;

  R_pixel_00 = (int)R[row+0][col+0];
  R_pixel_01 = (int)R[row+0][col+1];
  R_pixel_10 = (int)R[row+1][col+0];
  R_pixel_11 = (int)R[row+1][col+1];

  G_pixel_00 = (int)G[row+0][col+0];
  G_pixel_01 = (int)G[row+0][col+1];
  G_pixel_10 = (int)G[row+1][col+0];
  G_pixel_11 = (int)G[row+1][col+1];

  B_pixel_00 = (int)B[row+0][col+0];
  B_pixel_01 = (int)B[row+0][col+1];
  B_pixel_10 = (int)B[row+1][col+0];
  B_pixel_11 = (int)B[row+1][col+1];

  Y_pixel_00 = (16 << (K)) + C11 * R_pixel_00
                           + C12 * G_pixel_00
                           + C13 * B_pixel_00;
  Y_pixel_00 += (1 << (K-1)); // rounding
  Y_pixel_00 = Y_pixel_00 >> K;

  Y_pixel_01 = (16 << (K)) + C11 * R_pixel_01
                           + C12 * G_pixel_01
                           + C13 * B_pixel_01;
  Y_pixel_01 += (1 << (K-1)); // rounding
  Y_pixel_01 = Y_pixel_01 >> K;

  Y_pixel_10 = (16 << (K)) + C11 * R_pixel_10
                           + C12 * G_pixel_10
                           + C13 * B_pixel_10;
  Y_pixel_10 += (1 << (K-1)); // rounding
  Y_pixel_10 = Y_pixel_10 >> K;

  Y_pixel_11 = (16 << (K)) + C11 * R_pixel_11
                           + C12 * G_pixel_11
                           + C13 * B_pixel_11;
  Y_pixel_11 += (1 << (K-1)); // rounding
  Y_pixel_11 = Y_pixel_11 >> K;

  Y[row+0][col+0] = (uint8_t)Y_pixel_00;
  Y[row+0][col+1] = (uint8_t)Y_pixel_01;
  Y[row+1][col+0] = (uint8_t)Y_pixel_10;
  Y[row+1][col+1] = (uint8_t)Y_pixel_11;

  Cb_pixel_00 = (128 << (K)) - C21 * R_pixel_00
                             - C22 * G_pixel_00
                             + C23 * B_pixel_00;
  Cb_pixel_00 += (1 << (K-1)); // rounding
  Cb_pixel_00 = Cb_pixel_00 >> K;

  Cb_pixel_01 = (128 << (K)) - C21 * R_pixel_01
                             - C22 * G_pixel_01
                             + C23 * B_pixel_01;
  Cb_pixel_01 += (1 << (K-1)); // rounding
  Cb_pixel_01 = Cb_pixel_01 >> K;

  Cb_pixel_10 = (128 << (K)) - C21 * R_pixel_10
                             - C22 * G_pixel_10
                             + C23 * B_pixel_10;
  Cb_pixel_10 += (1 << (K-1)); // rounding
  Cb_pixel_10 = Cb_pixel_10 >> K;

  Cb_pixel_11 = (128 << (K)) - C21 * R_pixel_11
                             - C22 * G_pixel_11
                             + C23 * B_pixel_11;
  Cb_pixel_11 += (1 << (K-1)); // rounding
  Cb_pixel_11 = Cb_pixel_11 >> K;

  Cr_pixel_00 = (128 << (K)) + C31 * R_pixel_00
                             - C32 * G_pixel_00
                             - C33 * B_pixel_00;
  Cr_pixel_00 += (1 << (K-1)); // rounding
  Cr_pixel_00 = Cr_pixel_00 >> K;

  Cr_pixel_01 = (128 << (K)) + C31 * R_pixel_01
                             - C32 * G_pixel_01
                             - C33 * B_pixel_01;
  Cr_pixel_01 += (1 << (K-1)); // rounding
  Cr_pixel_01 = Cr_pixel_01 >> K;

  Cr_pixel_10 = (128 << (K)) + C31 * R_pixel_10
                             - C32 * G_pixel_10
                             - C33 * B_pixel_10;
  Cr_pixel_10 += (1 << (K-1)); // rounding
  Cr_pixel_10 = Cr_pixel_10 >> K;

  Cr_pixel_11 = (128 << (K)) + C31 * R_pixel_11
                             - C32 * G_pixel_11
                             - C33 * B_pixel_11;
  Cr_pixel_11 += (1 << (K-1)); // rounding
  Cr_pixel_11 = Cr_pixel_11 >> K;

  Cb[row>>1][col>>1] = chrominance_downsample( (uint8_t)Cb_pixel_00,
                                               (uint8_t)Cb_pixel_01,
                                               (uint8_t)Cb_pixel_10,
                                               (uint8_t)Cb_pixel_11);

  Cr[row>>1][col>>1] = chrominance_downsample( (uint8_t)Cr_pixel_00,
                                               (uint8_t)Cr_pixel_01,
                                               (uint8_t)Cr_pixel_10,
                                               (uint8_t)Cr_pixel_11);
} // END of CSC_RGB_to_YCC_brute_force_int()


static void CSC_RGB_to_YCC_neon( int row, int col) {
//
    int R_pixel_00, R_pixel_01, R_pixel_10, R_pixel_11;
    int G_pixel_00, G_pixel_01, G_pixel_10, G_pixel_11;
    int B_pixel_00, B_pixel_01, B_pixel_10, B_pixel_11;

    int  Y_pixel_00,  Y_pixel_01,  Y_pixel_10,  Y_pixel_11;
    int Cb_pixel_00, Cb_pixel_01, Cb_pixel_10, Cb_pixel_11;
    int Cr_pixel_00, Cr_pixel_01, Cr_pixel_10, Cr_pixel_11;

    R_pixel_00 = (int)R[row+0][col+0];
    R_pixel_01 = (int)R[row+0][col+1];
    R_pixel_10 = (int)R[row+1][col+0];
    R_pixel_11 = (int)R[row+1][col+1];

    G_pixel_00 = (int)G[row+0][col+0];
    G_pixel_01 = (int)G[row+0][col+1];
    G_pixel_10 = (int)G[row+1][col+0];
    G_pixel_11 = (int)G[row+1][col+1];

    B_pixel_00 = (int)B[row+0][col+0];
    B_pixel_01 = (int)B[row+0][col+1];
    B_pixel_10 = (int)B[row+1][col+0];
    B_pixel_11 = (int)B[row+1][col+1];

    // Put all the pixel values in a neon vector to make repeat calculations faster...?
    uint32x4_t RR = vld1q_u32 (R_pixel_00, R_pixel_01, R_pixel_10, R_pixel_11);
    uint32x4_t GG = vld1q_u32 (G_pixel_00, G_pixel_01, G_pixel_10, G_pixel_11);
    uint32x4_t BB = vld1q_u32 (B_pixel_00, B_pixel_01, B_pixel_10, B_pixel_11);

    uint32x4_t scalar_vector_C1 = vdupq_n_u32(C11);
    uint32x4_t RR_scaled = vmulq_u32(RR, scalar_vector_C1);

    uint32x4_t scalar_vector_C2 = vdupq_n_u32(C12);
    uint32x4_t GG_scaled = vmulq_u32(GG, scalar_vector_C2);

    uint32x4_t scalar_vector_C3 = vdupq_n_u32(C13);
    uint32x4_t BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    uint32x4_t YY = vaddq_u32(RR_scaled, GG_scaled);

    YY = vaddq_u32(YY, BB_scaled);
    YY = vaddq_u32(YY, (16 << (K)));
    YY = vaddq_u32(YY, (1 << (K-1)));

    YY = vshrq_n_u32(YY, K);
    uint32_t YY_result[4];
    vst1q_u32(YY_result, YY);

    Y[row+0][col+0] = (uint8_t)YY_result[0];
    Y[row+0][col+1] = (uint8_t)YY_result[1];
    Y[row+1][col+0] = (uint8_t)YY_result[2];
    Y[row+1][col+1] = (uint8_t)YY_result[3];

    // GETTING THE Cb VALUES
    scalar_vector_C1 = vdupq_n_u32(C21);
    RR_scaled = vmulq_u32(RR, scalar_vector_C1);

    scalar_vector_C2 = vdupq_n_u32(C22);
    GG_scaled = vmulq_u32(GG, scalar_vector_C2);

    scalar_vector_C3 = vdupq_n_u32(C23);
    BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    uint32x4_t CbCb = vsubq_u32((128 << (K)), RR_scaled);

    CbCb = vsubq_u32(CbCb, GG_scaled);
    CbCb = vaddq_u32(CbCb, BB_scaled);
    CbCb = vaddq_u32(CbCb, (1 << (K-1))); // rounding
    CbCb = vshrq_n_u32(CbCb, K); //shifting

    uint32_t CbCb_result[4];
    vst1q_u32(CbCb_result, CbCb);


    scalar_vector_C1 = vdupq_n_u32(C31);
    RR_scaled = vmulq_u32(RR, scalar_vector_C1);

    scalar_vector_C2 = vdupq_n_u32(C32);
    GG_scaled = vmulq_u32(GG, scalar_vector_C2);

    scalar_vector_C3 = vdupq_n_u32(C33);
    BB_scaled = vmulq_u32(BB, scalar_vector_C3);

    uint32x4_t CrCr = vaddq_u32((128 << (K)), RR_scaled);

    CrCr = vsubq_u32(CrCr, GG_scaled);

    CrCr = vsubq_u32(CrCr, BB_scaled);

    CrCr = vaddq_u32(CrCr, (1 << (K - 1)));

    CrCr = vshrq_n_u32(CrCr, K);

    uint32_t CrCr_result[4];
    vst1q_u32(CrCr_result, YY);


    Cr_pixel_00 = (128 << (K)) + C31 * R_pixel_00
                  - C32 * G_pixel_00
                  - C33 * B_pixel_00;
    Cr_pixel_00 += (1 << (K-1)); // rounding
    Cr_pixel_00 = Cr_pixel_00 >> K;

    Cr_pixel_01 = (128 << (K)) + C31 * R_pixel_01
                  - C32 * G_pixel_01
                  - C33 * B_pixel_01;
    Cr_pixel_01 += (1 << (K-1)); // rounding
    Cr_pixel_01 = Cr_pixel_01 >> K;

    Cr_pixel_10 = (128 << (K)) + C31 * R_pixel_10
                  - C32 * G_pixel_10
                  - C33 * B_pixel_10;
    Cr_pixel_10 += (1 << (K-1)); // rounding
    Cr_pixel_10 = Cr_pixel_10 >> K;

    Cr_pixel_11 = (128 << (K)) + C31 * R_pixel_11
                  - C32 * G_pixel_11
                  - C33 * B_pixel_11;
    Cr_pixel_11 += (1 << (K-1)); // rounding
    Cr_pixel_11 = Cr_pixel_11 >> K;


    Cr[row>>1][col>>1] = chrominance_downsample( (uint8_t)CrCr_result[0],
                                                 (uint8_t)CrCr_result[1],
                                                 (uint8_t)CrCr_result[2],
                                                 (uint8_t)CrCr_result[3]);

    Cb[row>>1][col>>1] = chrominance_downsample( (uint8_t)CbCb_result[0],
                                                 (uint8_t)CbCb_result[1],
                                                 (uint8_t)CbCb_result[2],
                                                 (uint8_t)CbCb_result[3]);
}


// =======
static uint8_t chrominance_downsample(
    uint8_t C_pixel_00, uint8_t C_pixel_01,
    uint8_t C_pixel_10, uint8_t C_pixel_11) {

  int temp;

  switch (CHROMINANCE_DOWNSAMPLING_MODE) {
    case 0:
      return( 0);
    case 1:
      return( C_pixel_00);
    case 2:
      temp = (int)C_pixel_00 + (int)C_pixel_01 + 
             (int)C_pixel_10 + (int)C_pixel_11;
      temp += (1 << 1); // rounding
      temp = temp >> 2;
      return( (uint8_t)temp);
    default:
      return( 0);
  }
} // END of chrominance_downsample()

// =======
void CSC_RGB_to_YCC( void) {
  int row, col; // indices for row and column
//
  for( row=0; row<IMAGE_ROW_SIZE; row+=2) {
    for( col=0; col<IMAGE_COL_SIZE; col+=2) { 
      //printf( "\n[row,col] = [%02i,%02i]\n\n", row, col);
      switch (RGB_to_YCC_ROUTINE) {
        case 0:
          break;
        case 1:
          CSC_RGB_to_YCC_brute_force_float( row, col);
          break;
        case 2:
          CSC_RGB_to_YCC_brute_force_int( row, col);
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

