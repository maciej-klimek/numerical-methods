x = -10:0.01:10;
y = cos(x);
z = sin(x);
%{
P = [x(:), y(:)];
%obrót wszystkich punktów 2D
for L = 0:0.01:2*pi
    A = [cos(L), -sin(L); sin(L), cos(L)];
    P_out = P*A;
    x= P_out(:,1);
    y= P_out(:,2);
    plot(x,y,'.')
    axis([-15, 15, -15, 15])
    pause(0.1); 
end
%}
for L = 0:0.01:pi;
    P = [x(:), y(:), z(:)];
    A = [1,0,0; 0, cos(L),-sin(L);0,sin(L),cos(L)];
    P_out = P*A;
    x= P_out(:,1);
    y= P_out(:,2);
    z= P_out(:,3);
    axis([-15, 15, -15, 15])
    plot3(x,y,z,'b.')
    pause(0.1)
end
