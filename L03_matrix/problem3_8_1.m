[elephant,fpr]=audioread('elephant.wav',[1,2^14]);
N = length(elephant);

[mosquito,fpr1]=audioread('mosquito.wav',[1,2^14]);
N = length(mosquito);

mixed = elephant+mosquito;

% Macierz ortogonalna cosinosow
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
%x = A(500,:) + A(1000,:); x = x’;
y = A*mixed; %widmo sygnału
figure; plot(y); title('y1(k)');

% Modyfikacja wyniku
s = 1700;
e = length(mixed) - 10000;
y(s:e,1) = zeros(e-s+1,1);
figure; plot(y); title('y2(k)');


figure; plot(mosquito); title('mosquito(n)');
soundsc(mosquito, fpr), pause;

figure; plot(mixed); title('mixed(n)');
soundsc(mixed, fpr), pause;

mixed_back = A'*y;
figure; plot(mixed_back); title('mixed_back(n)');
soundsc(mixed_back, fpr)