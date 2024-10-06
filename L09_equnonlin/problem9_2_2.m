% METODA BISEKCJI


clear all; close all; clc;

deg_45 = [2, 3];
deg_5 = [1, 5];
deg_80 = [-2, 1];

f_5 = @(x) tan(deg2rad(5))/2 * (x - deg_5(1)) .* (x - deg_5(2));
f_45 = @(x) tan(deg2rad(45))/2 * (x - deg_45(1)) .* (x - deg_45(2));        % Deklaracja funkcji
f_80 = @(x) tan(deg2rad(80))/2 * (x - deg_80(1)) .* (x - deg_80(2));

df_5 = @(x) 2 * tan(deg2rad(5))/2 * x - tan(deg2rad(5))/2 * sum(deg_5);
df_45 = @(x) 2 * tan(deg2rad(45))/2 * x - tan(deg2rad(45))/2 * sum(deg_45);     % Deklaracja pochodnych
df_80 = @(x) 2 * tan(deg2rad(80))/2 * x - tan(deg2rad(80))/2 * sum(deg_80);


x = linspace(-10, 10, 100);

figure;

subplot(1, 3, 1);
plot(x, f_5(x), 'b-', x, df_5(x), 'r-');
axis("padded");
title('5-10 stopni'); xlabel('x'); grid on;
legend('Funkcja z nachyleniem 5 stopni', 'Jej pochodna');

subplot(1, 3, 2);
plot(x, f_45(x), 'b-', x, df_45(x), 'r-');
axis("padded");
title('45 stopni'); xlabel('x'); grid on;
legend('Funkcja z nachyleniem 45 stopni', 'Jej pochodna');

subplot(1, 3, 3);
plot(x, f_80(x), 'b-', x, df_80(x), 'r-');
axis("padded");
title('80 stopni'); xlabel('x'); grid on;
legend('Funkcja z nachyleniem 80 stopni', 'Jej pochodna');

tolerance = 0.00001

it_sin = 1;
it_5 = 1;
it_45 = 1;
it_80 = 1;

bisection_sin = 0;
bisection_5 = 0;
bisection_45 = 0;
bisection_80 = 0;

x_5 = 1;
x_45 = 2;
x_80 = 1;

pause;

while (abs(bisection_5(end)-x_5)) > tolerance
    it_5 = it_5 + 1;
    bisection_5 = nonlinsolvers(f_5, df_5, 0, 2.9, 'bisection', it_5);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 5 stopni. Liczba iteracji: ');
disp(it_5);

while (abs(bisection_45(end)-x_45)) > tolerance
    it_45 = it_45 + 1;
    bisection_45 = nonlinsolvers(f_45, df_45, 1, 2.5, 'bisection', it_45);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 45 stopni. Liczba iteracji: ');
disp(it_45);

while (abs(bisection_80(end)-x_80)) > tolerance
    it_80 = it_80 + 1;
    bisection_80 = nonlinsolvers(f_80, df_80, 0, 2.5, 'bisection', it_80);
end
disp('Osiągnięto wymaganą dokładność dla nachylenia 80 stopni. Liczba iteracji: ');
disp(it_80);

figure;
subplot(1, 3, 1);
plot(1:it_5, bisection_5, "bo-"), xlabel('iter'); title('Parabola o nachylniu 5 stopni');
grid on;
subplot(1, 3, 2);
plot(1:it_45, bisection_45, "bo-"), xlabel('iter'); title('Parabola o nachylniu 45 stopni');
grid on;
subplot(1, 3, 3);
plot(1:it_80, bisection_80, "bo-"), xlabel('iter'); title('Parabola o nachylniu 80 stopni');
grid on;


pause;
figure;
plot([5, 45, 80], [length(bisection_5), length(bisection_45), length(bisection_80)], "ro--", 'MarkerSize', 10);
axis("padded");
title("Zależność ilości konieczych iteracji od nachylenia funkcji: ");
xlabel("Nachylenie w stopniach");
ylabel("Liczba iteracji");
grid on;



