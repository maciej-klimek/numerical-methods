clear all;
close all;
clc;

% matrix_splot.m
% Parametry
M = 5; % liczba wag systemu/ukladu/kanalu
w = 1:M; % wagi
N = M+(M-1); % dlugosc sygnalu niezbedna do identyfikacji wag
p = rand(1,N); % wejscie - probki pilota
y = conv(p,w); % wejscie p(n) --> wyjscie y(n): splot wejscia z wagami ukladu
% Estymacja wag ukladu
for m = 0:M-1
    P(1+m,1:M) = p( M+m : -1 : 1+m);
    disp(P(1+m,1:M))
end
y = y( M : N )
west = inv(P)*(y'); %P^(-1) * y
% Estymacja liczb nadanych
x = rand(1,M) % wejscie - probki nieznane
y = conv(x,w); % wyjscie - splot wejscia z wagami ukladu
W = zeros(M,M); % inicjalizacj
for m = 0:M-1
    W(1+m,1:1+m) = w( 1+m : -1 : 1);
end
y = y(1:M);
xest = inv(W)*(y') %W^(-1) * x
xerr = (x') - xest,
