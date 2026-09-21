function [x,k]=GDM(A,b,xk)
rk = b - A * xk;
k = 0;

while norm(rk) > 1e-6 
    k = k + 1;
    alpha = (rk' * rk) / (rk' * A * rk);
    xk = xk + alpha * rk;
    rk = b - A * xk;
    x=xk;
    k=k;
end

