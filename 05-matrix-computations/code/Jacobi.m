function [B,g]=Jacobi(A,b)
D=eye(size(A)).*A;
L=tril(-A,-1);
U=triu(-A,1);
% D-L-U
B=inv(D)*(L+U);
g=inv(D)*b;
end
