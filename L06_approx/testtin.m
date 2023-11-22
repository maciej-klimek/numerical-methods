clear all
close all
clc

syms t x;
x_val= -50:0.1:50;
fun = exp(-t^2);
F=(2/sqrt(pi))*int(fun, 0, x);
display(simplify(F))
display(simplify(taylor(F,x)));
F=matlabFunction(F)

%wspólczynniki A i B dla 2/2
A2=[0, 2/sqrt(pi), 0];
B2=[1/3, 0, 1];

% dla 3/3
A3=[(-2)/(30*sqrt(pi)), 0, 2/sqrt(pi), 0];
B3=[0, 3/10, 0, 1];

plot(x_val, F(x_val), 'r-')
hold on
plot(x_val,polyval(A2,x_val)./polyval(B2,x_val), 'g-')
hold on
plot(x_val,polyval(A3,x_val)./polyval(B3,x_val), 'b-')


legend("orignal", "pade 2/2", "pade 3/3");