close all;
clear all;
clc;

syms x;

f_origin_sym = (1+x^2)^-1
f2_taylor_sym = taylor(f_origin_sym, x)
f3_pade_sym = pade(f_origin_sym,"Order", [4, 4])

f1_origin_n = matlabFunction(f_origin_sym);
f2_taylor_n = matlabFunction(f2_taylor_sym);
f3_pade_n = matlabFunction(f3_pade_sym);

X = -20:0.1:20;
y1 = f1_origin_n(X);
y3 = f3_pade_n(X);

pause;

figure;
grid on;
hold on;
plot(X, y1, 'r-', LineWidth=5);
plot(X, y3, 'bo-', LineWidth=1.5);

legend("original", "aproximated");
