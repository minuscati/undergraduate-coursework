clear all;
clc;
A=[1 -3 2;4 4 -1;6 3 5];
u_0=[1 1 1]';
i=0;
% OUTPUT=cell(3,1);
% [V,D]=eig(A);
% while true
% y_k=A*u_0;
% m=norm(y_k,inf);
% u_0=y_k/m;
% i=i+1;
% OUTPUT{1}(:,i)=u_0;
% OUTPUT{2}(:,i)=y_k;
% OUTPUT{3}(:,i)=m;
% 
% if i > 1 && norm(OUTPUT{1}(:, i) - OUTPUT{1}(:, i-1), inf) < 1e-5
%         break; 
% end
% end
[u,v]=PWM(A,u_0);
% lambda=OUTPUT{3}(:,end);
disp('模最大的特征值:');
% disp(lambda)
disp(u)
disp('对应特征向量:');
% disp(OUTPUT{2}(:,end));
disp(v)
E=max(eig(A));
error=norm(u-E,inf);
