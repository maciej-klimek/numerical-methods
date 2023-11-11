[elephant_signal,fpr]=audioread('elephant.wav',[1,2^14]);
N = length(elephant_signal);

[mosquito_signal,fpr1]=audioread('mosquito.wav',[1,2^14]);
N = length(mosquito_signal);

mixed_signal = elephant_signal + mosquito_signal;

% Stworzenie macierzy ortogonalnych cosinosow
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));

% Tworzenie widm sygnałów
elephant_spectrum = A*elephant_signal;
mosquito_spectrum = A*mosquito_signal;
mixed_spectrum = A*mixed_signal;

% Odzyskiwanie sygnału - odejmowanie widma
recovered_spectrum = mixed_spectrum - elephant_spectrum;
recovered_signal = A' * recovered_spectrum;

figure; subplot(2, 1, 1); plot(mosquito_signal); title('mosquito signal (n)'); subplot(2, 1, 2); plot(mosquito_spectrum); title('mosquito spectrum (n)');
soundsc(mosquito_signal, fpr), pause;

figure; subplot(2, 1, 1); plot(elephant_signal); title('elephant signal (n)'); subplot(2, 1, 2); plot(elephant_spectrum); title('elephant spectrum (n)');
soundsc(elephant_signal, fpr), pause;

figure; subplot(2, 1, 1); plot(mixed_signal); title('mixed signal (n)'); subplot(2, 1, 2); plot(mixed_spectrum); title('mixed spectrum (n)');
soundsc(mixed_signal, fpr), pause;

figure; subplot(2, 1, 1); plot(recovered_signal); title('recovered signal (n)'); subplot(2, 1, 2); plot(recovered_spectrum); title('recovered spectrum (n)');
soundsc(recovered_signal, fpr);
