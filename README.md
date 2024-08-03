# SENG440 Project
## RGB and YCC Color Space Converter  

Color Space Conversion (RGB-to-YCC and YCC-to-RGB)



### How to Run the Code

In order to compile the code, run:
```shell
gcc -O3 -o CSC_main CSC_main.c CSC_RGB_to_YCC_01.c CSC_YCC_to_RGB_01.c ./NEW_CODE/rgb_to_ycc.c ./NEW_CODE/ycc_to_rgb.c ./NEW_CODE/upscale.c -mfpu=neon
```

For extra metrics, run the python testing file:
```shell
python3 test.py
```

If you can get the python libray called Pillow installed on your test machine, you can generate the image with
```shell
python3 image.py
```
