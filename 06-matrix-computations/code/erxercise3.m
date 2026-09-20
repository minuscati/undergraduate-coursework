clear all;
clc;
A = tril(randi([1, 10], 10));
A1=A;
if det(A) == 0;
disp(A);
end
b=eye(10);
for i=1:10
    A_inv(:,i)=QianDai(A,b(:,i));
end
e=norm(A1*A_inv-b);
