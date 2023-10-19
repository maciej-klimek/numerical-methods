close all
clear all
clc

a = 5;
u=[1;2;3]; v=[4;5;6];
A=[1,2,3;4,5,6;7,8,9]; B=eye(3);
S=[2,1;1,2];


(u')*v
u*(v')
A+B
A*B
(u.')*A
A*u
a*A

(A+B)*u
" = "
A*u+B*u

inv(A)
b=A*u
x=inv(A)*u

poly(A)
det(A)
rank(A)

(u.')*A*u

[V,D]=eig(S)
S=V*D*V'

[U,D,V]=svd(A)
A=U*D*V'


