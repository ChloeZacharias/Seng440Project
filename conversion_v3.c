#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define IN_BOUNDS(value) ((value) > 255 ? 255 : ((value) < 0 ? 0 : (value)))
#define Y_MACRO(R, G, B) (IN_BOUNDS((0.299 * R) + (0.587 * G) + (0.114 * B)))
#define CB_MACRO(R, G, B) (IN_BOUNDS(128 - (0.168736 * R) - (0.331264 * G) + (0.5 * B)))
#define CR_MACRO(R, G, B) (IN_BOUNDS(128 + (0.5 * R) - (0.418688 * G) - (0.081312 * B)))

#define R_MACRO(Y, Cb, Cr) (IN_BOUNDS(Y + ((1.402) * (Cr - 128))))
#define G_MACRO(Y, Cb, Cr) (IN_BOUNDS(Y - (0.344136 * (Cb - 128)) - (0.714136 * (Cr - 128))))
#define B_MACRO(Y, Cb, Cr) (IN_BOUNDS(Y + (1.772 * (Cb - 128))))


int main(int argc, char *argv[])
{
    char *conversion_type = argv[1];
    if (strcmp(conversion_type, "RGB") == 0)
    {
        float R = atof(argv[2]);
        float G = atof(argv[3]);
        float B = atof(argv[4]);
        printf("YCC %.0f %.0f %.0f", Y_MACRO(R, G, B), CB_MACRO(R, G, B), CR_MACRO(R, G, B));
    }
    else
    {
        float Y = atof(argv[2]);
        float Cr = atof(argv[3]);
        float Cb = atof(argv[4]);
        printf("RGB %.0f %.0f %.0f", R_MACRO(Y, Cb, Cr), G_MACRO(Y, Cb, Cr), B_MACRO(Y, Cb, Cr));
    }

    return 0;
}