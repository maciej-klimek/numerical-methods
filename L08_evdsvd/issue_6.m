% svd_ar.m
clear all; close all;
N = 2000;                    % liczba analizowanych probek danych
fpr = 10000; dt = 1/fpr;    % liczba probek danych na sekunde, okres probkowania
f = [ 1000  2000  3000 4000];  % liczba powtorzen na sekunde skladowych sinusoidalnych
d = [ 1     2    3 4];  % tlumienie kolejnych skladowych
A = [ 1     0.5   0.25 0.5];  % amplituda kolejnych skladowych
K = length(f);              % liczba skladowych sygnalu
x = zeros(1,N);             % inicjalizacja danych
for k = 1 : K               % generacja i akumulacja kolejnych sinusoid 
   x =  x + A(k) * exp(-d(k)*(0:N-1)*dt) .* cos(2*pi*f(k)*(0:N-1)*dt + pi*rand(1,1));
end
SNR = 60; x = awgn(x,SNR);                   % dodanie szumu, poziom w decybelach
figure; plot(x); grid; title('x(n)');        % pokazanie sygnalu
[fest1, dest1 ] = fLP(x,K,dt),               % metoda LP Prony'ego
[fest2, dest2 ] = fLPSVD(x,K,dt),            % metoda LP-SVD Kumaresana-Tuftsa
[fest1 fest2], [dest1 dest2],                % porownanie

err_fest1 = max(abs(fest1 - f.')),
err_dest1 = max(abs(dest1 - d.')),
err_fest2 = max(abs(fest2 - f.')),
err_dest2 = max(abs(dest2 - d.')),

if err_fest1 > err_fest2
   disp("flp lepsze niż flpsvd (f)")
else
   disp("flpsvd lepsze niż flp (f)")
end
if err_dest1 > err_dest2
   disp("flp lepsze niż flpsvd (d)")
else
   disp("flpsvd lepsze niż flp (d)")
end

%flp
%1) W miarę zwiększania liczby analizowanych próbek, błąd się zmniejsza
%2) W miarę zwiększania wartości składowych, błąd się zmniejsza
%3) W miarę zwiększania ilości składowych, błąd się zmniejsza
%4) W miarę zwiększania wartości SNR, błąd się zmniejsza

%flpsvd
%1) W miarę zwiększania liczby analizowanych próbek, błąd się zmniejsza
%2) W miarę zwiększania wartości składowych, błąd się zmniejsza
%3) W miarę zwiększania ilości składowych, błąd się zmniejsza
%4) W miarę zwiększania wartości SNR, błąd się zmniejsza

%flp okazało się lepsze dodatkowo jest szybsze

%{

Ten skrypt MATLAB generuje sygnał składający się z wielu tłumionych składowych sinusoidalnych
dodaje do niego szum, a następnie stosuje dwie metody estymacji częstotliwości i współczynników tłumienia tych składowych:
1) metoda LP Prony'ego (fLP) 
2) metoda LP-SVD Kumaresana-Tuftsa (fLPSVD). 

Sygnał x jest generowany poprzez dodanie do siebie stłumionych sinusoid o określonych częstotliwościach (f), współczynnikach tłumienia (d) i amplitudach (A).
Następnie do sygnału dodawany jest szum gaussowski (awgn) w celu uzyskania określonego stosunku sygnał-szum (SNR).

Zastosowane są dwie metody: metoda LP Prony'ego (fLP) i metoda LP-SVD Kumaresana-Tuftsa (fLPSVD).
Obliczane są szacowane częstotliwości (fest1 i fest2) oraz współczynniki tłumienia (dest1 i dest2) za pomocą tych metod.

Obliczane są maksymalne błędy bezwzględne (err_fest1, err_dest1, err_fest2, err_dest2) pomiędzy rzeczywistymi wartościami (f i d) a oszacowanymi wartościami.

Skrypt porównuje błędy i wyświetla, która metoda jest lepsza pod względem estymacji częstotliwości (f) i współczynnika tłumienia (d).
Dodatkowo skrypt przedstawia pewne spostrzeżenia na temat wydajności każdej z metod w różnych warunkach
takich jak zwiększanie liczby próbek, zmienianie wartości składowych czy modyfikowanie SNR.

Skrypt kończy się stwierdzeniem, która metoda radzi sobie lepiej na podstawie obliczonych błędów.

Dla obu metod (fLP i fLPSVD):
    Zwiększenie liczby próbek poprawia dokładność estymacji.
    Wyższy SNR prowadzi do mniejszych błędów.
    Zwiększanie wartości lub liczby składowych poprawia dokładność.
Skrypt wskazuje, że fLP jest nie tylko lepsze pod względem dokładności, ale również szybsze.

Rekomendacje:

Na podstawie dostępnych spostrzeżeń sugeruje, że fLP jest ogólnie preferowane w porównaniu do fLPSVD w tym konkretnym zastosowaniu.
Podsumowując, skrypt ocenia i porównuje dwie metody estymacji częstotliwości i współczynników tłumienia w sygnale składającym się z tłumionych sinusoid
dostarczając informacji na temat ich wydajności w różnych warunkach.

%}
