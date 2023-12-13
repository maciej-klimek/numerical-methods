% evd_jacobi.m
clear all;
close all;
clc; 

A = [ 2 0 1; 
    0 -2 0 ; 
    1 0 2 ]; % przyklad z Yang, 2005
[R, D] = solve(A)

A = [1 2 3 4;
    2 3 4 5;
    3 4 5 6;
    4 5 6 7;]
[R, D] = solve(A)

%{

Ta funkcja solve przyjmuje symetryczną macierz A i zwraca macierze R (zawierającą informacje o transformacjach)
i D (diagonalną macierz, która jest przybliżeniem wartości własnych macierzy A).
Wewnątrz funkcji solve zachodzi iteracyjne zerowanie elementów poza diagonalą macierzy D.
Wykorzystywane są tutaj rotacje zerujące, które są wykonywane za pomocą funkcji makeRi.

Ta funkcja generuje macierz rotacji zerującej Ri, która jest używana do
zerowania elementu A(p, q) w macierzy A. z wzorów 8.45 - 8.48 dla największych wartości bezwzględnych

Iteracje kontynuują się, dopóki wartość bezwzględna elementu spoza diagonalnej macierzy D jest większa niż wartość progowa (0.00000000001).

Na koniec program wyświetla macierz rotacji R i diagonalną macierz D, które są przybliżeniem wartości własnych macierzy A.

%} 

% Funkcja wykonuje dekompozycję wartości własnych macierzy za pomocą metody Jacobiego.
% Output: Macierz transformacji `R` oraz diagonalna macierz `D` zawierająca przybliżone wartości własne macierzy `A`.
function [R, D] = solve(A)
   D = A;
   [N, N] = size(D);
   R = eye(N);
   while (1)
       D_abs = abs(D - tril(D));
       [v, x, y] = find_max_value(D_abs);
       assert(D_abs(y, x) == v);
      
       if (abs(v) > 0.00000000001)
           Ri = makeRi(y, x, D);
           D = Ri.' * D * Ri;
           R = R * Ri;
       else
           return
       end
   end
end

% znajduje maksymalną wartość bezwzględną spoza diagonali w macierzy
function [v, x, y] = find_max_value(A)
   [N, N] = size(A);
   [v, i] = max(A, [], 'all');
   x = fix(i / N) + 1;
   y = rem(i, N);
   if (x == 0)
       % wtedy ostatni element wierszu
       y = N;
       x = x - 1;
       return
   end
end


% generuje macierz rotacji zerującej Ri, wykorzystywaną do eliminacji elementów spoza diagonali w macierzy `A`.
% p i q zostana wyzerowane
function [Ri] = makeRi(p, q, A)
   xi = (A(q,q) - A(p,p)) / 2 / A(p,q);
   if( xi > -eps )
       t =  (abs(xi) + sqrt(1 + xi^2));
   else
       t = -(abs(xi) + sqrt(1 + xi^2));
   end
  
   c = 1 / sqrt(1+t^2);
   s = t * c;
   [N, N] = size(A);
   Ri = eye(N);
   Ri(p, p) = c;
   Ri(q, q) = c;
   Ri(p, q) = -s;
   Ri(q, p) = s;
end
