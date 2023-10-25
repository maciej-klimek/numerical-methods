% matrix_obiekt3D.m
clear all; close all;

terrain = load('babia_gora.mat')
size(terrain)
figure; grid; plot3( terrain(:,1), terrain(:,2), terrain(:,3), 'b.' ); pause

angle_x = -45/180*pi; angle_y = -90/180*pi; angle_z = 135/180*pi;

rotation_x = [ 1, 0, 0; 0, cos(angle_x), -sin(angle_x); 0, sin(angle_x), cos(angle_x) ]; % macierz rotacji wzg. x
rotation_y = [ cos(angle_y), 0, -sin(angle_y); 0, 1, 0; sin(angle_y), 0, cos(angle_y) ]; % macierz rotacji wzg. y
rotaion_z = [ cos(angle_z), -sin(angle_z), 0; sin(angle_z), cos(angle_z), 0; 0, 0, 1 ]; % macierz rotacji wzg. z

rotation_matrix = rotaion_z * rotation_y * rotation_x;

rotated_terrain = rotation_matrix * terrain';
figure; grid; plot3( rotated_terrain(1,:), rotated_terrain(2,:), rotated_terrain(3,:), 'b.' ); pause     % wynik obrotu
 
