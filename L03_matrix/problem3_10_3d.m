clear all; close all; clc;

terrain_3d = load('sample_terrain.dat');

figure; 
grid; plot3d(terrain_3d);
grid on, pause;


%loop obrotu z ustalonym skokiem
figure;
for angle = 0:pi/64:pi
    plot3d(terrain_3d * rotate_matrix3d(0, 0, angle));
    grid on, pause(0.3);
end


function rotation_matrix3d = rotate_matrix3d(a_x, a_y, a_z)

    rotation_x = [ [1, 0, 0]; 0, cos(a_x), -sin(a_x); 0, sin(a_x), cos(a_x) ]; % macierz rotacji wzg. x
    rotation_y = [ cos(a_y), 0, -sin(a_y); [0, 1, 0]; sin(a_y), 0, cos(a_y) ]; % macierz rotacji wzg. y
    rotaion_z = [ cos(a_z), -sin(a_z), 0; sin(a_z), cos(a_z), 0; [0, 0, 1] ]; % macierz rotacji wzg. z
    
    rotation_matrix3d = rotaion_z * rotation_y * rotation_x;
end

function plot3d(matrix)
    plot3(matrix(:, 1), matrix(:, 2), matrix(:, 3), '-o');
end