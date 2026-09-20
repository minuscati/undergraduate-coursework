function [x,count]=SOR(A,b,x0,ep,w)
D=diag(diag(A));
L=tril(-A,-1);
U=triu(-A,1);
B=(D-w*L)\((1-w)*D+w*U);
g=w*inv(D-w*L)*b;
x=B*x0+g;
count=1;
while norm(x-x0)>=ep
    x0=x;
    x=B*x0+g;
    count=count+1;
end
end