function [x,count]=Jacobi(A,b,x0,ep)
D=diag(diag(A));
L=tril(-A,-1);
U=triu(-A,1);
% D-L-U
B=D\(L+U);
g=D\b;
x=B*x0+g;
count=1;
while norm(x-x0)>=ep
    x0=x;
    x=B*x0+g;
    count=count+1;
end

