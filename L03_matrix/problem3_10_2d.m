clear all; close all; clc;

x = -2*pi:pi/64:2*pi;
y = x.*sin(5*x);
shape_2d = [x; y];

%loop obrotu z ustalonym skokiem
figure;
for angle = 0:pi/60:60*pi

    angle_x = angle     %pozmieniac
    angle_y = -angle     %angle^sin(angle) * sin(cos(angle));

    rotation_matrix = [cos(angle_x), -sin(angle_y); sin(angle_x), cos(angle_y)]; % macierz rotacji
    rotated_shape_2d = shape_2d' * rotation_matrix;

    x = rotated_shape_2d(:,1);
    y = rotated_shape_2d(:,2);

    plot(x, y, '-r.');
    axis([-3*pi, 3*pi, -3*pi, 3*pi]);
    grid on, pause(0.01);
end





