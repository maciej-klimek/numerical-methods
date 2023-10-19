close all
clear all
clc

% a=fi( 1.625,0,8,7), a.bin,
% b=fi( 0.375,0,8,7), b.bin,
% c=fi( 0.375,1,8,7), c.bin,
% d=fi(-0.375,1,8,7), d.bin,
% 
pi1 = fi(pi, 0, 8, 6); pi1.bin;
pi2 = fi(pi, 0, 16, 14); pi2.bin;
pi3 = fi(pi, 1, 8, 5); pi3.bin;
pi4 = fi(pi, 1, 16, 13); pi4.bin;

pi1.double/pi
pi2.double/pi
pi3.double/pi
pi4.double/pi

