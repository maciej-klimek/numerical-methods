% Create rotation matrix
theta = 90; % to rotate 90 counterclockwise
R = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
% Rotate your point(s)
point = [3 5]' % arbitrarily selected
rotpoint = R*point;

plot(point, rotpoint, [1, 2], [3, 4])