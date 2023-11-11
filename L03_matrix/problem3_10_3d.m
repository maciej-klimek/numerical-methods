clear all; close all; clc;

terrain_3d = load('sample_terrain.dat');

figure; 
grid; plot3d(terrain_3d);
grid on, pause(2);


%loop obrotu z ustalonym skokiem
figure;
for angle = 0:pi/100:pi
    roteted_terrain_3d = terrain_3d * rotate_matrix3d(0, 0, angle);     %P_out = P_in * rot_matrix
    plot3d(roteted_terrain_3d);
    grid on, pause(0.05);
end


function rotation_matrix3d = rotate_matrix3d(angle_x, angle_y, angle_z)

    rotation_x = [[1, 0, 0]; [0, cos(angle_x), -sin(angle_x)]; [0, sin(angle_x), cos(angle_x)]];  % macierz rotacji wzg. x
    rotation_y = [[cos(angle_y), 0, -sin(angle_y)]; [0, 1, 0]; [sin(angle_y), 0, cos(angle_y)]];  % macierz rotacji wzg. y
    rotaion_z = [[cos(angle_z), -sin(angle_z), 0]; [sin(angle_z), cos(angle_z), 0]; [0, 0, 1] ];   % macierz rotacji wzg. z
    
    rotation_matrix3d = rotaion_z * rotation_y * rotation_x;    % macierz rotacji
end

function plot3d(matrix)
    plot3(matrix(:, 1), matrix(:, 2), matrix(:, 3), '-ro');
end