#include <stdio.h>
#include <string.h>
#include <stdlib.h>

float in_bounds(float value)
{
    if (value > 255)
    {
        return 255;
    }
    if (value < 0)
    {
        return 0;
    }
    return value;
}

void rgb_to_ycc(float R, float G, float B)
{
    float Y = (0.299 * R) + (0.587 * G) + (0.114 * B);
    float Cb = 128 - (0.168736 * R) - (0.331264 * G) + (0.5 * B);
    float Cr = 128 + (0.5 * R) - (0.418688 * G) - (0.081312 * B);

    printf("YCC %.0f %.0f %.0f", in_bounds(Y), in_bounds(Cb), in_bounds(Cr));
}

void ycc_to_rgb(float Y, float Cb, float Cr)
{
    float R = Y + ((1.402) * (Cr - 128));
    float G = Y - (0.344136 * (Cb - 128)) - (0.714136 * (Cr - 128));
    float B = Y + (1.772 * (Cb - 128));
    printf("RGB %.0f %.0f %.0f", in_bounds(R), in_bounds(G), in_bounds(B));
}

int main(int argc, char *argv[])
{
    char *conversion_type = argv[1];
    if (strcmp(conversion_type, "RGB") == 0)
    {
        float R = atof(argv[2]);
        float G = atof(argv[3]);
        float B = atof(argv[4]);
        rgb_to_ycc(R, G, B);
    }
    else
    {
        float Y = atof(argv[2]);
        float Cb = atof(argv[3]);
        float Cr = atof(argv[4]);
        ycc_to_rgb(Y, Cb, Cr);
    }

    return 0;
}