//
// Created by Caelum Dudek and Chloe Zacharias on 2024-08-01.
//
#include <stdint.h>
#include <stdio.h>
#include "../CSC_global.h"
#include "implementations.h"

void chrominance_up_sample(void) {
    register int max_row = IMAGE_ROW_SIZE - 1;
    register int max_col = IMAGE_COL_SIZE - 1;

    register uint8_t Cb_value;
    register uint8_t Cr_value;

    register int row = max_row - 1;
    register int col;
    do {
      col = max_col - 1;
      do {
        Cb_value = Cb[row>>1][col>>1];
        Cb_temp[row][col] = Cb_value;
        Cb_temp[row+1][col] = Cb_value;
        Cb_temp[row][col+1] = Cb_value;
        Cb_temp[row+1][col+1] = Cb_value;

        Cr_value = Cr[row>>1][col>>1];
        Cr_temp[row][col] = Cr_value;
        Cr_temp[row+1][col] = Cr_value;
        Cr_temp[row][col+1] = Cr_value;
        Cr_temp[row+1][col+1] = Cr_value;
        col-=2;
        // Best way to do this loop?
      } while (col+2);
      row-=2;
    } while (row+2);
}