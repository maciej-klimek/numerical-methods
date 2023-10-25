clear all; close all, clc;

x = -2*pi:pi/4:2*pi;
y = sin(x);

figure;
for angle = 0:pi/64:pi;
    shape_2d = [x(:), y(:)];
    rotation_matrix = [cos(angle), -sin(angle); sin(angle), cos(angle)]; % macierz rotacji
    rotated_shape_2d = shape_2d * rotation_matrix;
    x= rotated_shape_2d(:,1);
    y= rotated_shape_2d(:,2);

    plot(x, y, '-o');
    axis([-10, 10, -10, 10]);
    grid on, pause(0.3);;
end





