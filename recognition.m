function [R, V] = recognition(file, net)

t = im2double(imread(file));
x = t(:);
V = net(x);
y = round(V);

R = zeros(4, 1);

if y(1) == 1
    R = 'l';
elseif y(2) == 1
    R = 'k';
elseif y(3) == 1
    R = 'O';
elseif y(4) == 1
    R = 'K';
else
    R = 'unknown';
end
