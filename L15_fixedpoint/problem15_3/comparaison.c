#include "cordic-32bit.h"
#include "cordic-16bit.h"
#include <stdio.h>
#include <math.h>

// Twoje definicje i funkcje cordic16 i cordic32

// Funkcja pomocnicza do konwersji kątów z radianów na format używany przez cordic
int rad_to_cordic_angle(double radian, double mul)
{
    return (int)(radian * mul);
}

int main()
{
    int i;
    int sin_val_16, cos_val_16, sin_val_32, cos_val_32;
    double radian;

    printf("Porównanie CORDIC 16-bit i 32-bit:\n");
    printf("%-15s | %-15s | %-20s | %-20s | %-15s | %-20s | %-20s\n",
           "Kąt (stopnie)", "Sin (biblioteka)", "Sin CORDIC 16-bit",
           "Sin CORDIC 32-bit", "Cos (biblioteka)", "Cos CORDIC 16-bit",
           "Cos CORDIC 32-bit");

    for (i = -90; i <= 90; i += 10)
    {
        radian = i * M_PI / 180.0; // Konwersja stopni na radiany

        // Sprawdzenie zakresu kąta dla cordic
        // Może być konieczne dostosowanie dla zakresu kątów
        if (radian > M_PI / 2)
        {
            radian = half_pi - (radian - half_pi);
        }
        else if (radian < -M_PI / 2)
        {
            radian = -half_pi - (radian + half_pi);
        }

        cordic16(rad_to_cordic_angle(radian, 16384.0), &sin_val_16, &cos_val_16, CORDIC_NTAB);
        cordic32(rad_to_cordic_angle(radian, 1073741824.0), &sin_val_32, &cos_val_32, CORDIC_NTAB);

        printf("%-15d | %-15.6f | %-20.6f | %-20.6f | %-15.6f | %-20.6f | %-20.6f\n",
               i, sin(radian), sin_val_16 / 16384.0, sin_val_32 / 1073741824.0,
               cos(radian), cos_val_16 / 16384.0, cos_val_32 / 1073741824.0);
    }

    return 0;
}