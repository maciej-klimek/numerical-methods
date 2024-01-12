#include <stdio.h>

int main() {
    // Deklaracja zmiennych
    double liczba1, liczba2;

    // Pobieranie danych od użytkownika
    printf("Podaj pierwsza liczbe: ");
    scanf("%lf", &liczba1);

    printf("Podaj druga liczbe: ");
    scanf("%lf", &liczba2);

    // Wykonywanie operacji
    double suma = liczba1 + liczba2;
    double roznica = liczba1 - liczba2;
    double iloczyn = liczba1 * liczba2;

    // Sprawdzenie, czy druga liczba nie jest zerem przed dzieleniem
    double iloraz;
    if (liczba2 != 0) {
        iloraz = liczba1 / liczba2;
        printf("Iloraz: %.2f\n", iloraz);
    } else {
        printf("Nie można dzielić przez zero.\n");
    }

    // Wyświetlanie wyników
    printf("Suma: %.2f\n", suma);
    printf("Roznica: %.2f\n", roznica);
    printf("Iloczyn: %.2f\n", iloczyn);

    return 0;
}
