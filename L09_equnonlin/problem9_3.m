% METODA REGULA-FANSI


clear all; close all; clc;

deg_5 = [1, 5];     % miejsca zerowe funkcji
deg_45 = [2, 3];    
deg_80 = [-2, 1];

f_45 = @(x) tan(deg2rad(45))/2 * (x - deg_45(1)) .* (x - deg_45(2));        % definicja funckji
f_5 = @(x) tan(deg2rad(5))/2 * (x - deg_5(1)) .* (x - deg_5(2));
f_80 = @(x) tan(deg2rad(80))/2 * (x - deg_80(1)) .* (x - deg_80(2));

df_45 = @(x) 2 * tan(deg2rad(45))/2 * x - tan(deg2rad(45))/2 * sum(deg_45);     %definicja pochodnych
df_5 = @(x) 2 * tan(deg2rad(5))/2 * x - tan(deg2rad(5))/2 * sum(deg_5);
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

pause;
figure;
imshow(imread("regula_falsi.png"));
pause;


it = 12;

bisection_5 = nonlinsolvers(f_5, df_5, 0, 2.5, 'regula-falsi', it);       % szacowanie miejsc zerowcyh za pomocą metoda regula-falsi
bisection_45 = nonlinsolvers(f_45, df_45, 1, 2.9, 'regula-falsi', it);      
bisection_80 = nonlinsolvers(f_80, df_80, 0, 3, 'regula-falsi', it);

figure;
subplot(1, 3, 1);
plot(1:it, bisection_45, 'o-'); xlabel('iter'); ylabel('cb(iter)');
grid on;
title("45 stopni");
subplot(1, 3, 2);
plot(1:it, bisection_5, 'o-'); xlabel('iter'); ylabel('cb(iter)');
grid on;
title("5 stopni");
subplot(1, 3, 3);
plot(1:it, bisection_80, 'o-'); xlabel('iter'); ylabel('cb(iter)');
grid on;
title("80 stopni");

