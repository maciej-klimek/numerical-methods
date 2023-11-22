clear all;
close all;
clc;

syms t x;

f_e = exp(-t^2);
f_integral = int(f_e, 0, x);
f_sym = (2/sqrt(pi)) * f_integral
f_taylor = taylor(f_sym, x)

f_sym = matlabFunction(f_sym);

% wspólczynniki A i B dla M = 2, N = 2
A2_values = [0, 2/sqrt(pi), 0]
B2_values = [1/3, 0, 1]
pade_1 = (poly2sym(A2_values))/(poly2sym(B2_values))

% dla M = 3, N = 3;
A3_values = [(-2)/(30*sqrt(pi)), 0, 2/sqrt(pi), 0]
B3_values =[0, 3/10, 0, 1]
pade_2 = (poly2sym(A3_values))/(poly2sym(B3_values))


X = -30:0.1:30;

pause;

figure;
plot(X, f_sym(X), 'r-', LineWidth=5)
hold on
plot(X, polyval(A2_values, X)./polyval(B2_values, X), 'g--', LineWidth=3)
hold on
plot(X, polyval(A3_values, X)./polyval(B3_values, X), 'b--', LineWidth=3)
grid on;

legend("orignal", "pade N=2, M=2", "pade M=3, N=3");



