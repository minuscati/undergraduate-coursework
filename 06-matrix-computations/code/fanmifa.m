clear all;
clc;
% A = [3,0,-10;-1,3,4;0,1,-2];
% n=length(A);
% A0=A;
% A=LUfenjie(A);
% L = tril(A, -1) + eye(n);
% U = triu(A);
% % y=QianDai(L,b);
% % x=HuiDai(U,y);
% z0 = [1;1;1];
% k=0;
% x=QianDai(L,z0);
% y=HuiDai(U,z0);
% max_iter=10;
% while k<7
% x=QianDai(L,z0);
% y=HuiDai(U,z0);
% m=norm(y,inf);
% z0=y/m;
% k=k+1;
% end

A = [3,0,-10;-1,3,4;0,1,-2];
I = eye(3,3);
p = 4.3;
u0 = [1;1;1];
v = inv(A - p * I) * u0;
u = v / norm(v, inf);
i = 0;
while norm(u - u0, inf) > 1e-5
    u0 = u;
    v = inv(A - p * I) * u0;
    u = v / norm(v, inf);
    i=i+1
end
i
u
x = p + 1 / norm(v, inf)

