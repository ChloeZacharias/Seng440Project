//
// Created by Caelum Dudek and Chloe Zacharias on 2024-07-28.
//
#include <stdint.h>
#include <stdio.h>
#include "../CSC_global.h"
#include <arm_neon.h>
#include "neon_conversions.h"

#define Y_MAX 235
#define CrCb_MAX 240
#define YCC_MIN 16
#define RGB_MIN 0
#define RGB_MAX 255
#define DEBUG 0

static inline void print_debug(char* string) {
    if (DEBUG) {
        printf("%s", string);
        printf("\n");
    }
}

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
    int i = 3;
    for (; i>=0; --i){
        if (values[i] < YCC_MIN) {
            values[i] = YCC_MIN;
        }
        if (values[i] > CrCb_MAX)  {
            values[i] = CrCb_MAX;
        }
    }
}

static inline void clamp_rgb(int32_t *values) {
    int i = 3;
    for (; i>=0; --i){
        if (values[i] < RGB_MIN) {
            values[i] = RGB_MIN;
        }
        if (values[i] > RGB_MAX)  {
            values[i] = RGB_MAX;
        }
    }
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
static void chrominance_upsample(
        uint8_t C_pixel_00, uint8_t C_pixel_01,
        uint8_t C_pixel_10, uint8_t C_pixel_11,
        uint8_t *top, uint8_t *left, uint8_t *middle) {

    int temp_top;
    int temp_left;
    int temp_middle;

    switch (CHROMINANCE_UPSAMPLING_MODE) {
        case 0:
            *top = 0;
            *left = 0;
            *middle = 0;
            break;
        case 1:
            *top = (uint8_t)C_pixel_00;
            *left = (uint8_t)C_pixel_00;
            *middle = (uint8_t)C_pixel_00;
            break;
        case 2:
            temp_top = (int)C_pixel_00 + (int)C_pixel_01;
            temp_top += (1 << 0); // rounding
            *top = (uint8_t)(temp_top >> 1);
//
            temp_left = (int)C_pixel_00 + (int)C_pixel_10;
            temp_left += (1 << 0); // rounding
            *left = (uint8_t)(temp_left >> 1);
//
            temp_middle = (int)C_pixel_00 + (int)C_pixel_01 +
                          (int)C_pixel_10 + (int)C_pixel_11;
            temp_middle += (1 << 1); // rounding
            *middle = (uint8_t)(temp_middle >> 2);
            break;
        default:
            break;
    }
} // END of chrominance_upsample()

// =======
static void chrominance_array_upsample( void) {
    int row;
    int col;

    uint8_t top;
    uint8_t left;
    uint8_t middle;

    for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
        for( col=0; col<((IMAGE_COL_SIZE>>1)-1); col+=1) {
            chrominance_upsample( Cb[row+0][col+0], Cb[row+0][col+1],
                                  Cb[row+1][col+0], Cb[row+1][col+1],
                                  &top, &left, &middle);
            Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row+0][col+0];
            Cb_temp[(row<<1)+0][(col<<1)+1] = top;
            Cb_temp[(row<<1)+1][(col<<1)+0] = left;
            Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
            //
            chrominance_upsample( Cr[row+0][col+0], Cr[row+0][col+1],
                                  Cr[row+1][col+0], Cr[row+1][col+1],
                                  &top, &left, &middle);
            Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row+0][col+0];
            Cr_temp[(row<<1)+0][(col<<1)+1] = top;
            Cr_temp[(row<<1)+1][(col<<1)+0] = left;
            Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
        }
    }

    col = (IMAGE_COL_SIZE>>1) - 1;
    for( row=0; row<((IMAGE_ROW_SIZE>>1)-1); row+=1) {
        chrominance_upsample( Cb[row+0][col], Cb[row+0][col],
                              Cb[row+1][col], Cb[row+1][col],
                              &top, &left, &middle);
        Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row+0][col];
        Cb_temp[(row<<1)+0][(col<<1)+1] = top;
        Cb_temp[(row<<1)+1][(col<<1)+0] = left;
        Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
        //
        chrominance_upsample( Cr[row+0][col], Cr[row+0][col],
                              Cr[row+1][col], Cr[row+1][col],
                              &top, &left, &middle);
        Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row+0][col];
        Cr_temp[(row<<1)+0][(col<<1)+1] = top;
        Cr_temp[(row<<1)+1][(col<<1)+0] = left;
        Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
    }

    row = (IMAGE_ROW_SIZE>>1) - 1;
    for( col=0; col<((IMAGE_COL_SIZE>>1)-1); col+=1) {
        chrominance_upsample( Cb[row][col+0], Cb[row][col+1],
                              Cb[row][col+0], Cb[row][col+1],
                              &top, &left, &middle);
        Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col+0];
        Cb_temp[(row<<1)+0][(col<<1)+1] = top;
        Cb_temp[(row<<1)+1][(col<<1)+0] = left;
        Cb_temp[(row<<1)+1][(col<<1)+1] = middle;
        //
        chrominance_upsample( Cr[row][col+0], Cr[row][col+1],
                              Cr[row][col+0], Cr[row][col+1],
                              &top, &left, &middle);
        Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col+0];
        Cr_temp[(row<<1)+0][(col<<1)+1] = top;
        Cr_temp[(row<<1)+1][(col<<1)+0] = left;
        Cr_temp[(row<<1)+1][(col<<1)+1] = middle;
    }

    row = (IMAGE_ROW_SIZE>>1) - 1;
    col = (IMAGE_COL_SIZE>>1) - 1;
    Cb_temp[(row<<1)+0][(col<<1)+0] = Cb[row][col];
    Cb_temp[(row<<1)+0][(col<<1)+1] = Cb[row][col];
    Cb_temp[(row<<1)+1][(col<<1)+0] = Cb[row][col];
    Cb_temp[(row<<1)+1][(col<<1)+1] = Cb[row][col];
    //
    Cr_temp[(row<<1)+0][(col<<1)+0] = Cr[row][col];
    Cr_temp[(row<<1)+0][(col<<1)+1] = Cr[row][col];
    Cr_temp[(row<<1)+1][(col<<1)+0] = Cr[row][col];
    Cr_temp[(row<<1)+1][(col<<1)+1] = Cr[row][col];

} // END of chrominance_array_upsample()

void upsample(void) {
    register int max_row = (IMAGE_ROW_SIZE >> 1) - 1;
    register int max_col = (IMAGE_COL_SIZE >> 1) - 1;

    register uint8_t Cb_value;
    register uint8_t Cr_value;
    for (int row = max_row; row >= 0; row--) {
        for (int col = max_col; col >= 0; col--) {
            Cb_value = Cb[row][col];
            Cb_temp[row << 1][col << 1] = Cb_value;
            Cb_temp[row << 1][(col << 1) + 1] = Cb_value;
            Cb_temp[(row << 1) + 1][col << 1] = Cb_value;
            Cb_temp[(row << 1) + 1][(col << 1) + 1] = Cb_value;

            Cr_value = Cr[row][col];
            Cr_temp[row << 1][col << 1] = Cr_value;
            Cr_temp[row << 1][(col << 1) + 1] = Cr_value;
            Cr_temp[(row << 1) + 1][col << 1] = Cr_value;
            Cr_temp[(row << 1) + 1][(col << 1) + 1] = Cr_value;
        }
    }
}



/*
 *  _   _ ______ ____  _   _
 * | \ | |  ____/ __ \| \ | |
 * |  \| | |__ | |  | |  \| |
 * | . ` |  __|| |  | | . ` |
 * | |\  | |___| |__| | |\  |
 * |_| \_|______\____/|_| \_|
 *
 */


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

    uint32x4_t add_valueY = vdupq_n_u32((16 << (K)));
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

    uint32x4_t add_valueC = vdupq_n_u32((128 << (K)));


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

    Cr[row>>1][col>>1] = chrominance_downsample( (uint8_t)CrCr_result[0],
                                                 (uint8_t)CrCr_result[1],
                                                 (uint8_t)CrCr_result[2],
                                                 (uint8_t)CrCr_result[3]);

    Cb[row>>1][col>>1] = chrominance_downsample( (uint8_t)CbCb_result[0],
                                                 (uint8_t)CbCb_result[1],
                                                 (uint8_t)CbCb_result[2],
                                                 (uint8_t)CbCb_result[3]);
    if (DEBUG) {
        char buffer[256];
        sprintf(buffer, "RGB TO YCC\nY: %d | Cr: %d | Cb: %d", YY_result[0], CrCr_result[0], CbCb_result[0]);
        print_debug(buffer);
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

void CSC_YCC_to_RGB_neon( int row, int col) {

    // Upsample Cb and Cr into Cb_temp and Cr_temp
    //chrominance_array_upsample();

    int32_t Y_array[4] = {Y[row][col], Y[row][col+1], Y[row+1][col], Y[row+1][col+1]};

    int32_t Cb_array[4] = {Cb_temp[row][col],Cb_temp[row][col+1], Cb_temp[row+1][col], Cb_temp[row+1][col+1]};

    int32_t Cr_array[4] = {Cr_temp[row][col], Cr_temp[row][col+1], Cr_temp[row+1][col], Cr_temp[row+1][col+1]};

    // Put all the pixel values in a neon vector to make repeat calculations faster...?
    int32x4_t YY = vld1q_s32 (Y_array);

    // 1 << 4 is cheaper than 16
    int32x4_t scaled_vector_16 = vdupq_n_s32(1 << 4);
    YY = vqsubq_s32(YY, scaled_vector_16);

    // 1 << 6 is cheaper than 128
    int32x4_t scaled_vector_128 = vdupq_n_s32(1 << 7);
    int32x4_t CbCb = vld1q_s32 (Cb_array);
    CbCb = vqsubq_s32(CbCb, scaled_vector_128);

    int32x4_t CrCr = vld1q_s32 (Cr_array);
    CrCr = vqsubq_s32(CrCr, scaled_vector_128);

    // Red Conversion
    int32x4_t scalar_vector_D1 = vdupq_n_s32(D1);
    int32x4_t YY_scaled = vmulq_s32(YY, scalar_vector_D1);

    int32x4_t scalar_vector_D2 = vdupq_n_s32(D2);
    int32x4_t CrCr_scaled = vmulq_s32(CrCr, scalar_vector_D2);

    int32x4_t RR = vqaddq_s32(YY_scaled, CrCr_scaled);

    int32x4_t rounding = vdupq_n_s32(1 << (K));


    RR = vqaddq_s32(RR, rounding); // rounding
    RR = vshrq_n_s32(RR, K-2); //shifting

    int32_t RR_result[4];
    vst1q_s32(RR_result, RR);

    clamp_rgb(RR_result);

    //printf("%d\n",RR_result[0]);

    R[row][col] = (uint8_t)RR_result[0];
    R[row][col+1] = (uint8_t)RR_result[1];
    R[row+1][col] = (uint8_t)RR_result[2];
    R[row+1][col+1] = (uint8_t)RR_result[3];



    // Green Conversion

    int32x4_t scalar_vector_D3 = vdupq_n_s32(D3);
    int32x4_t scalar_vector_D4 = vdupq_n_s32(D4);

    CrCr_scaled = vmulq_s32(CrCr, scalar_vector_D3);
    int32x4_t CbCb_scaled = vmulq_s32(CbCb, scalar_vector_D4);

    int32x4_t GG = vqsubq_s32(YY_scaled, CrCr_scaled);
    GG = vqsubq_s32(GG, CbCb_scaled);

    GG = vqaddq_s32(GG, rounding); // Rounding

    GG = vshrq_n_s32(GG, K-2); // Shifting

    int32_t GG_result[4];
    vst1q_s32(GG_result, GG);

    clamp_rgb(GG_result);

    G[row][col] = (uint8_t)GG_result[0];
    G[row][col+1] = (uint8_t)GG_result[1];
    G[row+1][col] = (uint8_t)GG_result[2];
    G[row+1][col+1] = (uint8_t)GG_result[3];

    // Blue Conversion

    int32x4_t scalar_vector_D5 = vdupq_n_s32(D5);
    CbCb_scaled = vmulq_s32(CbCb, scalar_vector_D5);

    int32x4_t BB = vqaddq_s32(YY_scaled, CbCb_scaled);

    BB = vqaddq_s32(BB, rounding); // rounding

    BB = vshrq_n_s32(BB, K-2); //shifting

    int32_t BB_result[4];
    vst1q_s32(BB_result, BB);

    clamp_rgb(BB_result);


    B[row][col] = (uint8_t)BB_result[0];
    B[row][col+1] = (uint8_t)BB_result[1];
    B[row+1][col] = (uint8_t)BB_result[2];
    B[row+1][col+1] = (uint8_t)BB_result[3];

    if (DEBUG && 0) {
        char buffer[256];
        sprintf(buffer, "YCC TO RGB\nR: %d | G: %d | B: %d", RR_result[0], BB_result[0], GG_result[0]);
        print_debug(buffer);
    }

}




