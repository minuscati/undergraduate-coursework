%%最速下降法
clear all;
clc;

A = [0.78 -0.02 -0.12 -0.14; -0.02 0.86 -0.04 0.06;
    -0.12 -0.04 0.72 -0.08; -0.14 0.06 -0.08 0.74];
b = [0.76 0.08 1.12 0.68]';
x_0 = [0 0 0 0]'; 
%%最速下降法
x=GDM(A,b,x_0);
% % rk = b - A * x_0;
% % k = 0;
% % 
% % while norm(rk) > 1e-6 
% %     k = k + 1;
% %     alpha = (rk' * rk) / (rk' * A * rk);
% %     x_0 = x_0 + alpha * rk;
% %     rk = b - A * x_0;
% % end
 disp(x);
 e1=norm(A*x-b,inf);

%%共轭梯度法
% r0 = b - A * x_0;
% k = 0;
% rk=r0;
% while norm(rk) > 1e-6 
%      k = k + 1;
%      if k==1
%          p0=r0;
%      else
%         beta=(rk' * rk) / (rm' * rm);
%         p0=rk+beta*p0;
%      end
%      alpha=(rk'*rk)/(p0'*A*p0);
%      x_0= x_0 + alpha * p0;
%      rm=rk;
%      rk= rk-alpha*A*p0;
% end
% x=x_0;
% x=CGM(A,b,x_0);
% e2=norm(A*x-b,inf);
