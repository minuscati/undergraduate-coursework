%%LU分解求Ax=b;
clear all;
clc;
n=100;
A=8*eye(n)+diag(2*ones(1,n-1),1)+diag(1*ones(1,n-1),-1);
b=ones(100,1);
A1=LUfenjie(A);
% 输出LU分解后的矩阵
L = tril(A1, -1) + eye(n);
U = triu(A1);
y=QianDai(L,b);
x=HuiDai(U,y);
e1=norm(A*x-b,Inf)

%%平方根法求Ax=b;
clear all;
clc;
n=100;
A=8*eye(n)+diag(1*ones(1,n-1),1)+diag(1*ones(1,n-1),-1);
b=ones(100,1);
L=Cholesky(A);
A1=L*L';
y=QianDai(L,b);
x=HuiDai(L',y);
e2=norm(A*x-b,Inf)



