clear all;
clc;
A=[2 3 4;4 4 5;0 3 6];
z0 = [1;0.5;0.5];
% A=[3 2;4 5];
A0=A;
n=length(A);
[u,v]=IPM(A,z0);
% A=LUfenjie(A);
% L = tril(A, -1) + eye(n);
% U = triu(A);
% OUTPUT=cell(3,1);
% i=0;
% while true
% x=QianDai(L,z0);
% y=HuiDai(U,x);
% m=norm(y,inf);
% z0=y/m;
% i=i+1;
% OUTPUT{1}(:,i)=y;
% OUTPUT{2}(:,i)=z0;
% OUTPUT{3}(:,i)=m;
% if i > 1 && norm(OUTPUT{3}(:, i) - OUTPUT{3}(:, i-1), inf) < 1e-4
%         break; 
% end
% end
% lambda=1/OUTPUT{3}(:,end)
disp('模最小的特征值:');
disp(u)
disp('对应特征向量:');
disp(v);
E=min(abs(eig(A0)));
error=norm(u-E,inf);