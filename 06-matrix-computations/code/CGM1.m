function [x,k,P]=CGM1(A,b,xk)
P=zeros(3,3);
r0 = b - A * xk;
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
     xk= xk + alpha * p0;
     rm=rk;
     rk= rk-alpha*A*p0;
end
x=xk;
end