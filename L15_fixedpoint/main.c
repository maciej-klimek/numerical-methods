#include <stdio.h>

int main()
{

    double num_1, num_2;
    double result;
    double *result_p;

    num_1 = 12;
    num_2 = 15;

    result = num_1 + num_2;
    result_p = &result;

    result_p++;
    *result_p = num_1 * num_2;

    printf("wynik 1: %.2f\n", result);
    printf("adres: %p\n", &result);

    printf("wynik 2: %.2f\n", *result_p);
    printf("adres: %p\n", result_p);
    printf("adres poprzedni: %p\n", result_p - 1);

    return 0;
}
