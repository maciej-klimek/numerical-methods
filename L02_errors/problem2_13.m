clear all;
close all;
clc;
format long;

a = 4.3, c = -4.8, b = -1e+4*(4*a*c), %zmienic na 10

x1 = (-b - sqrt(b^2-4*a*c)) / (2*a), 
x2 = (-b + sqrt(b^2-4*a*c)) / (2*a), 

if abs(x1) > abs(x2)                    
    x2_1 = 2*c /(-b - sqrt(b^2 -4*a*c)),
else
    x1_1 = 2*c /(-b + sqrt(b^2 -4*a*c)),
end
