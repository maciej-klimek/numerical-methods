clear all; close all;

m = 5; v0 = 50; alpha = 30; h = 50; g = 9.81;
alpha = alpha/180*pi;
x = 0:1:350;

% Definicja funkcji do minimalizacji
equation = @(b, x) ((tan(alpha) + (m*g)/(b*v0 * cos(alpha)))*x + ((g*m^2)/b^2) * log(1-((x*b)/(m*v0*cos(alpha)))));

% Ustalamy opcje dla funkcji fminunc (minimalizacja funkcji)
options = optimset('Display', 'off');

% Początkowa wartość b (można eksperymentalnie dostosować)
initial_b = 0.01;

% Minimalizacja funkcji zmiennych b przy użyciu fminunc
b = fminunc(@(b) equation(b, x(end)), initial_b, options);

% Wyliczenie y(x) dla obliczonej wartości b
y = equation(b, x);

% Rysowanie wykresu
figure;
plot(x, y);
xlabel('x');
ylabel('y');
title('y(x)');
grid on;

% Znalezienie zasięgu rzutu (punkt, w którym y(x) osiąga wartość 0)
[~, index] = min(abs(y));
range = x(index);

fprintf('Zasięg rzutu: %.2f m\n', range);
fprintf('Wartość optymalnego b: %.4f\n', b);
