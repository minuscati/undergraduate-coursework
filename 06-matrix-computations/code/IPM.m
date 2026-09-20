function [u,v]=IPM(A,u_0)
%%Inverse Power Method 反幂法
n=length(A);
A=LUfenjie(A);
L = tril(A, -1) + eye(n);
U = triu(A);
i=0;
m=0;
while true
m_old=m;
x=QianDai(L,u_0);
y=HuiDai(U,x);
m=norm(y,inf);
u_0=y/m;
i=i+1;

if i > 1 && norm(m_old-m, inf) < 1e-4
        break; 
end
end
u=1/m;
v=u_0;
