function [A,H]=UHessenberg(A)
n=length(A);
h=cell(n-2, 1);
H=cell(n-2, 1);
for k=1:n-2
    [v,b]=house(A(k+1:n,k));
    I=eye(length(v));
    A(k+1:n,k:n)=(I-b*v*v')*A(k+1:n,k:n);
    A(1:n,k+1:n)=A(1:n,k+1:n)*(I-b*v*v');
    h{k}=I-b*v*v';
    H_k = eye(n);
    H_k(k+1:end, k+1:end) = I - b * v * v';
    H{k}=H_k;
end