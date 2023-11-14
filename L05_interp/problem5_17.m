% interp_obiekt3D.m
clear all; close all;

%load('X.mat');
load('babia_gora.dat'); X=babia_gora;

x = X(:,1); y = X(:,2); z = X(:,3);            % pobranie x,y,z
xvar = min(x) : (max(x)-min(x))/200 : max(x);  % zmiennosc x
yvar = min(y) : (max(y)-min(y))/200 : max(y);  % zmiennosc y

[Xi,Yi] = meshgrid( xvar, yvar );              % siatka interpolacji xi, yi

out_nearest = griddata(x, y, z, Xi,Yi, 'nearest');
out_linear = griddata(x, y, z, Xi,Yi, 'linear');
out_spline = griddata(x, y, z, Xi,Yi, 'natural');
out_cubic = griddata(x, y, z, Xi,Yi, 'cubic');

figure;
subplot(2,2,1);
title("nearest");
mesh(out_nearest);

subplot(2,2,2);
title("linear");
mesh(out_linear);   

subplot(2,2,3);
title("spline");
mesh(out_spline);   

subplot(2,2,4);
title("cubic");
mesh(out_cubic);  
pause;

figure;
subplot(2,2,1);
title("nearest");
surf(out_nearest);

subplot(2,2,2);
title("linear");
surf(out_linear);   

subplot(2,2,3);
title("spline");
surf(out_spline);   

subplot(2,2,4);
title("cubic");
surf(out_cubic);  
pause;
            
