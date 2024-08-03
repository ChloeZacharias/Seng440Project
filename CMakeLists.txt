cmake_minimum_required(VERSION 3.27)

# Project name and version
project(Seng440Project VERSION 1.0 LANGUAGES C CXX)

# Set the C standard
set(CMAKE_C_STANDARD 11)

# Include directories
include_directories(Color_Space_Conversion/LESSON_103_CSC/C)

# Add the executable
add_executable(Seng440Project
        CSC_main.c
        CSC_main_02.c
        CSC_RGB_to_YCC_01.c
        CSC_YCC_to_RGB_01.c
        CSC_RGB_to_YCC_01.c
        NEW_CODE/rgb_to_ycc.c
        NEW_CODE/ycc_to_rgb.c
        NEW_CODE/upscale.c
)

# Specify additional source files if they are not included in the main source files
set(SOURCE_FILES
        NEW_CODE/arm_neon.h
        CSC_global.h
        NEW_CODE/implementations.h
)

# Add these source files to the target
target_sources(Seng440Project PRIVATE ${SOURCE_FILES})

# Toolchain file for cross-compiling
set(CMAKE_TOOLCHAIN_FILE path/to/toolchain.cmake)

# Compiler and linker flags for NEON support
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15")

# Ensure the compiler is able to compile a simple program
include(CheckCCompilerFlag)
check_c_compiler_flag(-mfpu=neon COMPILER_SUPPORTS_NEON)



# Link necessary libraries if required
# target_link_libraries(Seng440Project <library_name>)
