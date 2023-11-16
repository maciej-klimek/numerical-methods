clear all; close all; clc; format long;

A = [6, 1, 2; 5, 7, 1; 8, 9, 0];

D1 = get_all_minors(A)

D2 = get_all_minors_rec(A, zeros(size(A)), 1, 1)


A_inverse1 = 1/(det(A)) * D1
A_inverse2 = 1/(det(A)) * D2
inv(A)
