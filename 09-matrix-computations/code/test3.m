%%Jacobi
clear all;
clc;
A=[10 3 1;2 -10 3;1 3 10];
b=[14 -5 14]';
[B1,g1]=Jacobi(A,b);
% D=eye(size(A)).*A;
% L=tril(-A,-1);
% U=triu(-A,1);
% % D-L-U
% B1=inv(D)*(L+U);
% g1=inv(D)*b;
X=zeros(3,20);
for i=1:19
X(:,i+1)=B1*X(:,i)+g1;
end

%%Gauss-Seidel
clear all;
clc;
A=[10 3 1;2 -10 3;1 3 10];
b=[14 -5 14]';
% D=eye(size(A)).*A;
% L=tril(-A,-1);
% U=triu(-A,1);
% B2=inv(D-L)*U;
% g2=inv(D-L)*b;
[B2,g2]=GS(A,b);
X=zeros(3,20);
for i=1:19
X(:,i+1)=B2*X(:,i)+g2;
end

%%SOR
clear all;
clc;
A=[0.78 -0.02 -0.12 -0.14;-0.02 0.86 -0.04 0.06;
    -0.12 -0.04 0.72 -0.08;-0.14 0.06 -0.08 0.74];
b=[0.76 0.08 1.12 0.68]';
w=1.03;
D=eye(size(A)).*A;
L=tril(-A,-1);
U=triu(-A,1);
B3=inv(D-w*L)*((1-w)*D+w*U);
g3=w*inv(D-w*L)*b;
% [B3,g3]=SOR(A,b,w);
X=zeros(4,20);
% X(:,1)=[1 1 1];
for i=1:19
X(:,i+1)=B3*X(:,i)+g3;
end