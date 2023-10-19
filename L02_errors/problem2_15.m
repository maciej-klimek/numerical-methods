clear all;
close all;
clc;

sAngle = 0;             %kat poczatkowy
N = 20000;              %liczba iteracji

fq1 = 20;               %czestotliwosc
fq2 = 40;

pFq = 192000;           %probki na sekunde

dt1 = fq1/pFq;          %sekundy na jedna probke
dt2 = fq2/pFq;

omega1 = 2*pi*dt1;      %predkosc kolowa
omega2 = 2*pi*dt2;

a1 = 2*cos(omega1);
a2 = 2*cos(omega2);

a1 = 2*cos(omega1)*2^14 %test wartośći
a2 = 2*cos(omega2)*2^14

%inicjalizacja tablic
y1 = [sin(sAngle + omega1), sin(sAngle + 2*omega1)];
x1 = zeros(1, N);

y2 = [sin(sAngle + omega2), sin(sAngle + 2*omega2)];
x2 = zeros(1, N);

x1(2) = omega1;
x2(2) = omega2;

%y = ay(n - 1) - y(n - 2)
for n=3:N
    y1(n) = a1*y1(n-1) - y1(n-2);
    x1(n) = x1(n-1) + omega1;
    y2(n) = a2*y2(n-1) - y2(n-2);
    x2(n) = x2(n-1) + omega2;
end


subplot(2, 1, 1)
plot(x1, y1);
grid;
subplot(2, 1, 2)
plot(x2, y2);
grid;

