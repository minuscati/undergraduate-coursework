function [B,g]=SOR(A,b,w)
D=eye(size(A)).*A;
L=tril(-A,-1);
U=triu(-A,1);
B=inv(D-w*L)*((1-w)*D+w*U);
g=w*inv(D-w*L)*b;
end