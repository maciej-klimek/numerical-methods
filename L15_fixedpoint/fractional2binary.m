clear all;
close all;
clc;
format long


%dane wejściowe
a = 1234.57849; 
n = 16;     % bity dla częsci calkowitej
m = 22;     % bity dla częsci ulamkowej


num_str = strsplit(string(a), ".");

int_part = str2num(num_str(1));

int_bin = zeros(1, n);
frac_bin = zeros(1, m);


% konwersja czesci calkowitej
k = n;
int_part_temp = int_part;
while int_part_temp > 0
    int_bin(1, k) = mod(int_part_temp, 2);
    int_part_temp = floor(int_part_temp / 2);
    k = k - 1;
end
 
frac_part_temp = a - int_part;
frac_part = frac_part_temp;
index = 1;
len = m;


% konwersja czesci ulamkowej
while frac_part_temp >= 0 && len > 1
    frac_part_temp = frac_part_temp * 2;
    if frac_part_temp == 1 || frac_part_temp == frac_part
        frac_bin(1, index) = 1;
        break
    elseif frac_part_temp > 1
        frac_bin(1, index) = 1;
        frac_part_temp = frac_part_temp - 1;
    else
        frac_bin(1, index) = 0;
    end
    index = index + 1;
    len = len - 1;
end

disp('Liczba a w postaci dziesiętnej:');
a

disp('Część całkowita w postaci binarnej:');
int_bin

disp('Część ułamkowa w postaci binarnej:');
frac_bin

