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
out_spline = griddata(x, y, z, Xi,Yi, 'v4');
out_cubic = griddata(x, y, z, Xi,Yi, 'cubic');

figure;
subplot(2,2,1);
mesh(out_nearest);
title("nearest");

subplot(2,2,2);
mesh(out_linear);   
title("linear");

subplot(2,2,3);
mesh(out_spline);   
title("spline");

subplot(2,2,4);
mesh(out_cubic);
title("cubic");

figure;
subplot(2,2,1);
surf(out_nearest);
title("nearest");

subplot(2,2,2);
surf(out_linear);   
title("linear");

subplot(2,2,3);
surf(out_spline);   
title("spline");

subplot(2,2,4);
surf(out_cubic);
title("cubic");
pause;
            
