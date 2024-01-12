clear all;
close all;
clc;

format long

a = 1234.57849; % your float point number
n = 16;         % number bits for integer part of your number      
m = 22;         % number bits for fraction part of your number
% binary number
d2b = [ fix(rem(fix(a)*pow2(-(n-1):0),2)), fix(rem( rem(a,1)*pow2(1:m),2))];  % 
% the inverse transformation
b2d = d2b*pow2([n-1:-1:0 -(1:m)].');

% Rozdzielanie liczby a na część całkowitą i dziesiętną
str = strsplit(string(a), ".");
integerPart = str2num(str{1});

% Inicjalizacja macierzy binarnych
d2bn2 = zeros(1, n);
d2bM2 = zeros(1, m);

% Konwersja części całkowitej liczby a na reprezentację binarną
i = n;
while integerPart > 0
    d2bn2(1, i) = mod(integerPart, 2);
    integerPart = floor(integerPart / 2);
    i = i - 1;
end

% Przygotowanie do konwersji części dziesiętnej liczby a
numM = a - str2num(str{1});
temp = numM;
wow = 1;
p = m;

% Konwersja części dziesiętnej liczby a na reprezentację binarną
while numM >= 0 && p > 1
    numM = numM * 2;
    if numM == 1 || numM == temp
        d2bM2(1, wow) = 1;
        break
    elseif numM > 1
        d2bM2(1, wow) = 1;
        numM = numM - 1;
    else
        d2bM2(1, wow) = 0;
    end
    wow = wow + 1;
    p = p - 1;
end

% Wyświetlanie wyników

disp('Reprezentacja liczby a:');
disp(d2b);

disp('Reprezentacja binarna liczby a:');
disp(d2bn2);

disp('Reprezentacja binarna części dziesiętnej liczby a:');
disp(d2bM2);


