%列主元消去求Ax=b;
clear all;
clc;
n=84;
A=6*eye(n)+diag(1*ones(1,n-1),1)+diag(8*ones(1,n-1),-1);
b=[7 15*ones(1,82) 14]';
[P,A1]=Liezhuyuan(A);
L = tril(A1, -1) + eye(n);
U = triu(A1);
y=QianDai(L,P*b);
x=HuiDai(U,y);
e1=norm(A*x-b,Inf);



