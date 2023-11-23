close all;
clear all;
clc;

% za 1*

% Definicja macierzy A i wektora b
A = [1 2;
    3 4;
    5 6];

b = [7; 8; 9];


ATA = A.' * A;


if det(ATA) == 0
    error('Macierz A^TA nie jest odwracalna');
end

ATA_inv = inv(ATA);

ATb = A.' * b;

% Oblicz wynik x
x = ATA_inv * ATb;

% Wyświetl wynik
disp('Rozwiązanie układu równań:');
disp(x);