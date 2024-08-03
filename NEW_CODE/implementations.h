//
// Created by Caelum Dudek and Chloe Zacharias on 2024-07-28.
//
#include <stdint.h>

#ifndef SENG440PROJECT_IMPLEMENTATIONS_H
#define SENG440PROJECT_IMPLEMENTATIONS_H

void CSC_RGB_to_YCC_neon(int row, int col);

void CSC_YCC_to_RGB_neon(int row, int col);

void chrominance_up_sample(void);

#endif //SENG440PROJECT_IMPLEMENTATIONS_H