//
// Created by Caelum Dudek and Chloe Zacharias on 2024-08-01.
//
#include <stdint.h>
#include <stdio.h>
#include "../CSC_global.h"
#include <arm_neon.h>
#include "implementations.h"

void chrominance_up_sample(void) {
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