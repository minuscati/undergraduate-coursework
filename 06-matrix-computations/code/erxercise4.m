%%法方程组
clear all;
clc;
A=[1 19^2;1 25^2;1 31^2;1 38^2];
A1=A;
m=length(A);
n=width(A);
b=[19.0 32.3 49.0 73.3]';
C=A'*A;
d=A'*b;
L=Cholesky(C);
C1=L*L';
y=QianDai(L,d);
x=HuiDai(L',y);
error=norm(C*x-d,Inf)
%QR分解
% [v,b]=house (A(:,1));
% I=eye(4);
% H1=I-b*v*v';
% A1=H1*A;
% [v1,b1]=house(A1(2:4,2));
% I1=eye(3);
% H2=I1-b1*v1*v1';
% A2=H2*A1(2:4,2)

% [Q,R]=qr(A);
% y=Q'*b;
% x=R\y;

for j=1:n
    if j<m
        [v1,b1]=house (A(j:m,j));
        A(j:m,j:n)=(eye(m-j+1)-b1*v1*v1')*A(j:m,j:n)
        d(j)=b1
        A(j+1:m,j)=v1(2:m-j+1)
    end
end
v1=[1;A(2:4,1)];
v2=[1;A(3:4,2)];
b1=d(1);
b2=d(2);
I1=eye(4);
V2=[0;v2];
H1=I1-b1*v1*v1';
H2=I1-b2*V2*V2';
R=zeros(4,2);
R(1,1)=A(1,1);
R(1:2,2)=A(1:2,2);
Q=H1*H2;
y1=Q'*b;
x1=R\y1;
error2=norm(C*x1-d,Inf)


% [Q1,R1]=Hqr(A1);
