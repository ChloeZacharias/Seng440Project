cmake_minimum_required(VERSION 3.27)
project(Seng440Project C)

set(CMAKE_C_STANDARD 11)

include_directories(Color_Space_Conversion/LESSON_103_CSC/C)

add_executable(Seng440Project
        Color_Space_Conversion/LESSON_103_CSC/C/arm_neon.h
        Color_Space_Conversion/LESSON_103_CSC/C/CSC_global.h
        Color_Space_Conversion/LESSON_103_CSC/C/CSC_main.c
        Color_Space_Conversion/LESSON_103_CSC/C/CSC_main_02.c
        Color_Space_Conversion/LESSON_103_CSC/C/CSC_RGB_to_YCC_01.c
        Color_Space_Conversion/LESSON_103_CSC/C/CSC_YCC_to_RGB_01.c
        Color_Space_Conversion/LESSON_103_CSC/OCTAVE/rgb_to_ycc.m)
