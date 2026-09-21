clear all;
clc;
A=[1 -3 2;4 4 -1;6 3 5];
u_0=[1 1 1]';
% [u,v]=PWM(A,u_0);
%%Power Method 幂法
i=0;
n=length(A);
while true
u_old=u_0;
y_k=A*u_0;
m=norm(y_k,inf);
u_0=y_k/m;
i=i+1;
if i > 1 && norm(u_0-u_old, inf) < 1e-5
        break; 
end
end

% [A,H]=UHessenberg(A);


