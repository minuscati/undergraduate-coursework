%%Jacobi
clear all;
clc;
A=[0.78 -0.02 -0.12 -0.14;-0.02 0.86 -0.04 0.06;
    -0.12 -0.04 0.72 -0.08;-0.14 0.06 -0.08 0.74];
b=[0.76 0.08 1.12 0.68]';
[B1,g1]=Jacobi(A,b);
X1=zeros(4,20);
i=1;
while i<19
    X1(:,i+1)=B1*X1(:,i)+g1;
    if X1(:,i+1)-X1(:,i)<1e-6
    ANS1=X1(:,i+1)
    break;
    end
    i=i+1;
end
norm(A*ANS1-b,inf)
% for i=1:19
% X(:,i+1)=B1*X(:,i)+g1;
% end
% if X(:,i+1)-X(:,i)<1e-6
%     ANS=X(:,i+1)
% end

%%GS
[B2,g2]=GS(A,b);
X2=zeros(4,20);
i=1;
while i<19
    X2(:,i+1)=B2*X2(:,i)+g2;
    if X2(:,i+1)-X2(:,i)<1e-6
    ANS2=X2(:,i+1)
    break;
    end
    i=i+1;
end
norm(A*ANS2-b,inf)

%%SOR
w=1.03;
[B3,g3]=SOR(A,b,w);
X3=zeros(4,20);
i=1;
while i<19
    X3(:,i+1)=B3*X3(:,i)+g3;
    if X3(:,i+1)-X3(:,i)<1e-6
    ANS3=X3(:,i+1)
    break;
    end
    i=i+1;
end
norm(A*ANS3-b,inf)

