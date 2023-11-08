clear all; close all; clc; format long;

A = [6, 1, 2; 5, 7, 1; 8, 9, 0];
%A = A + 0.01 * randn(size(A));
det(A)
 
b = [5; 11; 2];

x1 = inv(A)*b
x2 = A\b
x3 = pinv(A)*b

b_back_inverse = A*x1
b_back_optimal = A*x2
b_back_pseudoinverse = A*x2

if x1 == x2 == x3
    disp("the same");
else
    disp("different");
end

err = max(abs(x1-x2))
