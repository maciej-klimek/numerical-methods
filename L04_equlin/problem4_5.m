clear all; close all; clc; format long;

A = [6, 1, 2; 5, 7, 1; 8, 9, 0];

D = NaN(size(A));

for c=1:size(A,1)
  for r=1:size(A,2)
    D(c,r) = det(A([1:c-1 c+1:end],[1:r-1 r+1:end]));
  end
end

D = D';

A_inverse = 1/(det(A)) * D
inv(A)
,