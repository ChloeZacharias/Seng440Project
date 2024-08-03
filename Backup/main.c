#include <stdio.h>
#include <stdint.h>

int main()
{
    // TEST RGB values
    int32_t R = 48;
    int32_t G = 29;
    int32_t B = 219;

    int32_t Y = 16 + (((R << 6) + (R << 1) + (G << 7) + G + (B << 4) + (B << 3) + B) >> 8);
    int32_t Cb = 128 + ((-((R << 5) + (R << 2) + (R << 1)) - ((G << 6) + (G << 3) + (G << 1)) + (B << 7) - (B << 4)) >> 8);
    int32_t Cr = 128 + (((R << 7) - (R << 4) - ((G << 6) + (G << 5) - (G << 1)) - ((B << 4) + (B << 1))) >> 8);

    printf("Y: %u\n", Y);
    printf("Cb: %u\n", Cb);
    printf("Cr: %u\n", Cr);

    return 0;
}