//
// Created by Caelum Dudek and Chloe Zacharias on 2024-08-01.
//
#include <stdint.h>
#include <stdio.h>
#include "../CSC_global.h"
#include "implementations.h"

#define DEBUG 0

void chrominance_up_sample(void) {
    const size_t max_row = IMAGE_ROW_SIZE - 1;
    const size_t max_col = IMAGE_COL_SIZE - 1;

    uint8_t Cb_value;
    uint8_t Cr_value;

    // Copies the value of one pixel into it's four neighbouring pixels to the right, down, and bottom right
    // in order to up scale, this method is faster than others, and doesn't affect image quality drastically on
    // simpler images.

    for (size_t row = max_row - 1; row < max_row; row -= 2) {
        for (size_t col = max_col - 1; col < max_col; col -= 2) {
            Cb_value = Cb[row >> 1][col >> 1];
            Cb_temp[row][col] = Cb_value;
            Cb_temp[row + 1][col] = Cb_value;
            Cb_temp[row][col + 1] = Cb_value;
            Cb_temp[row + 1][col + 1] = Cb_value;

            Cr_value = Cr[row >> 1][col >> 1];
            Cr_temp[row][col] = Cr_value;
            Cr_temp[row + 1][col] = Cr_value;
            Cr_temp[row][col + 1] = Cr_value;
            Cr_temp[row + 1][col + 1] = Cr_value;
#if DEBUG
            printf("Pixel (%d, %d)(%d, %d)\n      (%d, %d)(%d, %d)\nCb: %d | Cr: %d\n",
                   row, col, row, col+1, row+1, col, row+1, col+1, Cb_value, Cr_value);
#endif
        }
    }
} // END of chrominance_up_sample()