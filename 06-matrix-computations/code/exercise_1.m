clear all;
clc;
%%1
syms x
f=1/(1+x^2);
ANS_1=int(f,x);
ANS_2=diff(f,x);
%%2
A=rand(4);
B=[1 0 0 1;-1 1 0 1;-1 -1 1 1;-1 -1 -1 1];
ANS_3=A+B;
ANS_4=A-B;
ANS_5=A*B;
ANS_6=A/B;
ANS_7=norm(B,1);
ANS_8=norm(B,Inf);
ANS_9=norm(B);
%%3
M=linspace(1,50,100)';
N=zeros(100,1);
N(1,1)=1;
sum=1;
for i=2:100
  sum=sum+100*((M(i,1)-M(i-1,1)^2))^2+(1-M(i-1,1))^2;
  N(i,1)=sum;
end
%%4
L=[1 0 0 0;2 1 0 0;4 3 1 0; 3 4 1 1];
b=[4 3 4 2]';
y=QianDai(L,b);
% ANS_10=norm(L*y-b,1);%%向量
ANS_10=norm(L.*y'-b,1);%%for循环



    


