clear all;
clc;
A=[5 -2 -5 -1;
    1 0 -3 2;
    0 2 2 -3;
    0 0 1 -2];
A0=A;
while i<200
[Q,R]=qr(A);
A=R*Q;
i=i+1;
D=diag(A);
end
D

disp('QR方法所求特征值:');
disp(D)
% error=norm(D-eig(A0),inf)
% disp('对应特征向量:');
% disp();
[A1,H]=UHessenberg(A0);
ANSWER=H{2}*H{1}*A0*H{1}*H{2};
error=norm(ANSWER-A1,inf);
disp('上Hessenberg矩阵:');
disp(A)
disp('正交阵H1:');
disp(H{1})
disp('正交阵H2:');
disp(H{2})

% B=A(2:3,2:3);
% lambda(1,1)=D(1,1);
% lambda(2:3,1)=eig(B);
% lambda(4,1)=D(end,1);