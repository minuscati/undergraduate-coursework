clear all;
clc;
A=[2 1 -1;1 4 0;-1 0 2];
b=[1 -1 -2]';
A1=0.5.*A;
b1=-0.5.*b;
x_0=[0 0 0]';
[x2,k2]=GDM(A,b,x_0);%%最速
e2=norm(b-A*x2,inf);
P=zeros(3,3);
r0 = b - A * x_0;
k = 0;
rk=r0;
while norm(rk) > 1e-6 
     k = k + 1;
     if k==1
         p0=r0;
     else
        beta=(rk' * rk) / (rm' * rm);
        p0=rk+beta*p0;
     end
     P(:,k)=p0;
     alpha=(rk'*rk)/(p0'*A*p0);
     x_0= x_0 + alpha * p0;
     rm=rk;
     rk= rk-alpha*A*p0;
end
