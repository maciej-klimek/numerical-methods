clear all;
close all;
clc;

N = 100;
p_num = 4;
X = linspace(0, (N/p_num)*2*pi, N); 
sin_function = sin(X);
period = 2*pi;
interp_X = linspace(0, (N/p_num)*2*pi, N*8); 
interp_sin_function = zeros(size(interp_X)); 

for i = 1:length(interp_X)
    for n = 1:length(X)
        interp_sin_function(i) = interp_sin_function(i) + sin_function(n) * sinc(pi/period * (interp_X(i) - X(n)));
    end
end

plot(X, sin_function, 'mo', interp_X, interp_sin_function, 'g-'); 
legend('Sinusoida oryginalna', 'Sinusoida zinterpolowana');
xlabel('Czas');
ylabel('Amplituda');
title('Interpolacja sinusoidy przy użyciu funkcji sinc()');