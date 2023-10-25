% matrix_transform.m
clear all; close all;
% Dane wejsciowe
[x,fpr]=audioread('mowa.wav',[1,2^14]);
N = length(x);
figure; plot(x); title('x(n)');
% Transformacja liniowa/ortogonalna - ANALIZA
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
x = A(500,:) + A(1000,:); x = x'; % tutaj czyta 500 - 1000
y = A*x;
figure; plot(y); title('y(k)');
% Modyfikacja wyniku
%y(N/8+1:N,1) = zeros(7*N/8,1); %widać wartości dołu do 1/8
%y(N/4+1:N,1) = zeros(3*N/4,1); %widać wartości dołu do 1/4, zeruje wszystko po
%y(1:N/16,1) = zeros(1*N/16,1); % widać wartości góry od 1/16, zeruje wszystko przed
%y(1:N/8,1) = zeros(1*N/8,1); % widać wartości góry od 1/8
%y(1000)=0;
figure; plot(y); title('y(k)');
% Transformacja odwrotna - SYNTEZA
xback = A'*y;
figure; plot(xback); title('xback(n)');
soundsc(x,fpr); 
soundsc(xback,fpr);

