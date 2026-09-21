clear all;
clc;
A=[1 19^2;1 25^2;1 31^2;1 38^2];
[m,n]=size(A);
[Q,R]=Hqr(A);
[Q1,R1]=zqr(A);
b=[19.0 32.3 49.0 73.3]';
c1=Q1'*b;
x=HuiDai(R1,c1(1:n));
% x=c1(1:n)R1