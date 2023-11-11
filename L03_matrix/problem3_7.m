clear all; close all;

% Dane wejsciowe
[x,fpr]=audioread('mowa.wav',[1,2^14]);
N = length(x);
figure; plot(x); title('x(n)');

% Transformacja liniowa/ortogonalna
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
% x = A(500,:) + A(1000,:); x = x';
y = A*x; % --> widmo sygnału
figure; plot(y); title('y(k)');


% Modyfikacja wyniku

od = 3000;
do = length(x) - 1000;
y(od:do,1) = zeros(do-od+1,1);

y(1000) = 0;

figure; plot(y); title('y(k)');


% Transformacja odwrotna - SYNTEZA
xback = A'*y;
figure; plot(xback); title('xback(n)');

soundsc(x,fpr); pause
soundsc(xback,fpr);