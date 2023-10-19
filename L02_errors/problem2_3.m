close all
clear all
clc

a=fi( 11.25,0,8,4), a.bin,
b=fi( 4.75,0,8,4), b.bin,
c=fi( 4.75,1,8,4), c.bin,
d=fi(-4.75,1,8,4), d.bin,

pi1 = fi(pi, 0, 8, 6); pi1.bin;
pi2 = fi(pi, 0, 16, 12); pi2.bin;
pi3 = fi(pi, 1, 8, 6); pi3.bin;
pi4 = fi(pi, 1, 16, 12); pi4.bin;

pi1.double/pi
pi2.double/pi
pi3.double/pi
pi4.double/pi