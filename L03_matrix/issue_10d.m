x = -10:0.01:10;
y = cos(x);
z = sin(x);


for L = 0:0.01:2*pi
    P = [x(:), y(:)];
    A = [cos(L), -sin(L); sin(L), cos(L)];
    P_out = P*A;
    x= P_out(:,1);
    y= P_out(:,2);
    plot(x,y,'b.');
    axis([-15, 15, -15, 15]);
    pause(0.1); 
end

