clear all;
clc;

format long g;
v0 = [1;1;1];
u0 = [1;1;1];
A = [2 3 4;4 4 5;0 3 6];
v = A * u0;
u = v / norm(v, inf);
i = 0;
while norm(u - u0, inf) >= 1e-5
    u0 = u;
    v = A * u0;
    u = v / norm(v, inf);
    i =i+1;
end
norm(v, inf)
i
u
