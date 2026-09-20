clear all;
clc;
G1=[2.2	5 8;
    2.5	6 7;
    3	3 9;
    3.2	8 6];
G2=[2.8	7	6
    3.5	8	7
    4.8	9	8];
G3=[1.7	3	4
    2.2	4	2
    2.7	4	3];
n=10;
mu1=mean(G1);
mu2=mean(G2);
mu3=mean(G3);
s1=0;s2=0;s3=0;
del1= G1-mu1;
del2= G2-mu2;
del3= G3-mu3;
for i=1:4
s1=s1+(G1(i,:)-mu1)'*(G1(i,:)-mu1);
end
for i=1:3
s2=s2+(G2(i,:)-mu2)'*(G2(i,:)-mu2);
s3=s3+(G3(i,:)-mu3)'*(G3(i,:)-mu3);
end
sig1=1/3*s1;
sig2=1/2*s2;
sig3=1/2*s3;
NEWDATA=[3 8 5];
D1=(NEWDATA-mu1)*inv(sig1)*(NEWDATA-mu1)';
D2=(NEWDATA-mu2)*inv(sig2)*(NEWDATA-mu2)';
D3=(NEWDATA-mu3)*inv(sig3)*(NEWDATA-mu3)';
a = [D1 D2 D3];
[m index] = min(a); 
%          D2(j,:)=(NEWDATA(j,:)-mu2)*inv(sig2)*(NEWDATA(j,:)-mu2)';
%          D3(j,:)=(NEWDATA(j,:)-mu3)*inv(sig3)*(NEWDATA(j,:)-mu3)';
% D2=zeros(6,1);
% D3=zeros(6,1);
% D=zeros(6,1);
%      for j=1:6
%          D1(j,:)=(NEWDATA(j,:)-mu1)*inv(sig1)*(NEWDATA(j,:)-mu1)';
%          D2(j,:)=(NEWDATA(j,:)-mu2)*inv(sig2)*(NEWDATA(j,:)-mu2)';
%          D3(j,:)=(NEWDATA(j,:)-mu3)*inv(sig3)*(NEWDATA(j,:)-mu3)';
%          a = [D1(j,:) D2(j,:) D3(j,:)];
%          [m index] = min(a); 
%          D(j,:) = index;
%      end
% D_Z=[D1 D2 D3];
