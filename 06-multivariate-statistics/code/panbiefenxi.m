clear all;
clc;
n=35;k=3;
[num]=xlsread("E:\irisdata.xls");
G1=num(1:35,:);
G2=num(36:70,:);
G3=num(71:end,:);
mu1=mean(G1);
mu2=mean(G2);
mu3=mean(G3);
s1=0;s2=0;s3=0;
del1= G1-mu1;
del2= G2-mu2;
del3= G3-mu3;
for i=1:35
s1=s1+(G1(i,:)-mu1)'*(G1(i,:)-mu1);
s2=s2+(G2(i,:)-mu2)'*(G2(i,:)-mu2);
s3=s3+(G3(i,:)-mu3)'*(G3(i,:)-mu3);
end
sig1=1/(n-1)*s1;
sig2=1/(n-1)*s2;
sig3=1/(n-1)*s3;
NEWDATA=[7.2 3.6 6.1 2.5;
         5.5 2.5 4 1.3;
         5.4 3.9 1.3 0.4;
         5.1 2.5 3 1.1;
         5 3.2 1.2 0.2;
         6.7 3.1 5.6 2.3];
D1=zeros(6,1);
D2=zeros(6,1);
D3=zeros(6,1);
D=zeros(6,1);
     for j=1:6
         D1(j,:)=(NEWDATA(j,:)-mu1)*inv(sig1)*(NEWDATA(j,:)-mu1)';
         D2(j,:)=(NEWDATA(j,:)-mu2)*inv(sig2)*(NEWDATA(j,:)-mu2)';
         D3(j,:)=(NEWDATA(j,:)-mu3)*inv(sig3)*(NEWDATA(j,:)-mu3)';
         a = [D1(j,:) D2(j,:) D3(j,:)];
         [m index] = min(a); 
         D(j,:) = index;
     end
D_Z=[D1 D2 D3];
     

