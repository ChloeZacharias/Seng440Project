# SENG440 Project
## RGB and YCC Color Space Converter  

Color Space Conversion (RGB-to-YCC and YCC-to-RGB)

Color Space Conversion is a method to adapt digital or analog media for 
certain devices and applications. In this project, we have implemented and optimized
the conversion between the RGB and YCC color spaces using C and the NEON(advanced SIMD) 
instruction set. 

Additionally, this project does its best to follow the conventions of BARR-C for safety, 
you can read more about the libraries and documentation below.

[BARR-C Coding Standards](https://barrgroup.com/sites/default/files/barr_c_coding_standard_2018.pdf)

[Official ARM NEON Website](https://www.arm.com/technologies/neon)

![output_image from the program|400](output_image.png)

_This project is optimized for an ARMv7 v7l system such as the ARM Cortex-A15 as it has support of NEON instructions_

### How to Run the Code

In order to compile the code, run:
```shell
gcc -O3 -o CSC_main CSC_main.c CSC_RGB_to_YCC_01.c CSC_YCC_to_RGB_01.c ./NEW_CODE/rgb_to_ycc.c ./NEW_CODE/ycc_to_rgb.c ./NEW_CODE/upscale.c -mfpu=neon
```

For extra metrics, run the python testing file and view the latest LOGS:
```shell
python3 test.py
```

If you can get the python library called Pillow installed(`pip3 install requirements.txt`) on your test machine, you can generate the image with
```shell
python3 image.py
```
otherwise, GIMP works to view the image_output_RGB_64_48.data with a width of 64 and a height of 48
