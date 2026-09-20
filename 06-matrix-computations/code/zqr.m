function [Q,R]=zqr(A)
[m,n]=size(A);
Q=eye(m);R=A;
for j=1:n
    if j<m
        [v,b]=house (R(j:m,j));
        R(j:m,j:n)=(eye(m-j+1)-b*v*v')*R(j:m,j:n)
        v=[zeros(j-1,1);v];
        Q=(eye(m)-b*v*v')*Q;
%         R(j+1:m,j)=v(2:m-j+1)
    end
end
Q=Q';
R=R(1:n,1:n);
end