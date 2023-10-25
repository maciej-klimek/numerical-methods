% matrix_transform.m
clear all; close all;
% Dane wejsciowe
N = 2^13
[x,fpr]=audioread('mos.wav',[1,N]);
[y,fpr]=audioread('hip.wav',[1,N]);
mixed = x + y;
figure; plot(x); title('mos(n)');
figure; plot(y); title('hip(n)');
% Transformacja liniowa/ortogonalna - ANALIZA
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
mixedSpec = A*mixed;
figure; plot(mixedSpec); title('MixedSpec');
% Transformacja odwrotna - SYNTEZA
mixedback = A'*y;
figure; plot(mixedback); title('mixedback(n)');
soundsc(x,fpr);
soundsc(y,fpr);
soundsc(mixed,fpr); 
soundsc(mixedback,fpr);
