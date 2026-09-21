clear all;
clc;
% A=[2 3 2;10 3 4;3 6 1];
% u_0=[0 0 1]';
u_0 = [1;1;1];
A = [2,-1,0;-1,2,-1;0,-1,2];
i=0;
OUTPUT=cell(5,1);
% max_iter=10;
while true
y_k=A*u_0;
m=norm(y_k,inf);
u_0=y_k/m;
i=i+1;
OUTPUT{1}(:,i)=u_0;
OUTPUT{2}(:,i)=y_k;
OUTPUT{3}(:,i)=m;

if i > 1 && norm(OUTPUT{1}(:, i) - OUTPUT{1}(:, i-1), inf) < 1e-5
        break; % 如果满足条件，跳出循环
end
% Ans_mat(i+1,1)=i;
% Ans_mat(i+1,2:4)=u_0;
% Ans_mat(i+1,5:7)=y_k;
% Ans_mat(i+1,8)=m;
end
lambda=OUTPUT{3}(:,end)