function [B,g]=GS(A,b)
D=eye(size(A)).*A;
L=tril(-A,-1);
U=triu(-A,1);
B=inv(D-L)*U;
g=inv(D-L)*b;
end