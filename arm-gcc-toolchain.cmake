# Specify the cross compiler
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Specify the cross compiler toolchain path
set(TOOLCHAIN_ROOT "C:/Program Files (x86)/Arm GNU Toolchain arm-none-linux-gnueabihf/13.3 rel1")
set(CMAKE_C_COMPILER "${TOOLCHAIN_ROOT}/bin/arm-none-linux-gnueabihf-gcc.exe")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_ROOT}/bin/arm-none-linux-gnueabihf-g++.exe")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_ROOT}/bin/arm-none-linux-gnueabihf-gcc.exe")

# Specify the sysroot
set(CMAKE_SYSROOT "${TOOLCHAIN_ROOT}/arm-none-linux-gnueabihf/libc")

# Compiler and linker flags for NEON support
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15")

# Specify the target environment
set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}")

# Adjust FIND_ROOT_PATH mode settings
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
