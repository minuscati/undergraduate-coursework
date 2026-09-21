%%qr--非函数调用形式
clear all;
clc;
A=[1 19^2;1 25^2;1 31^2;1 38^2];
A1=A;
[m,n]=size(A);
Q=eye(m);
R=A;
for j=1:n
    if j<m
        [v,b]=house (R(j:m,j));
        k=length(v);
        R(j:m,j:n)=(eye(k)-b*v*v')*R(j:m,j:n)
        v=[zeros(m-k,1);v];
        Q=(eye(m)-b*v*v')*Q;
        R(j+1:m,j)=v(2:m-j+1)
    end
end
Q=Q';

%%---------
%%前代法
clear all;
clc;
L=[1 0 0 0;2 1 0 0;4 3 1 0; 3 4 1 1];
b=[4 3 4 2]';
n=length(L);
for i=1:n-1
    b(i)=b(i)/L(i,i);
%     for j=i+1:n
%         b(j)=b(j)-L(j,i)*b(i);
%     end
     b(i+1:n)=b(i+1:n)-L(i+1:n,i)*b(i);
end
b(n)=b(n)/L(n,n);
y=b;

%%---------
%%LU分解
clear all;
clc;
A=[1 4 7;2 5 8;3 6 10];
n=length(A);
L=eye(n);
for i=1:n-1
    L(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i:n)=A(i+1:n,i:n)-L(i+1:n,i)*A(i,i:n);
end
U=A;

%%---------
%%Choleky分解
clear all;
clc;
A=[1 2 1;2 8 4;1 4 6];
n=length(A);
L=zeros(n,n);
for k = 1:n-1
    s1 = sum(L(k, 1:k-1).^2);
    L(k, k) = sqrt(A(k, k) - s1);
    
    for i = k+1:n
        s2 = sum(L(i, 1:k-1) .* L(k, 1:k-1));
        L(i, k) = (A(i, k) - s2) / L(k, k);
    end
end
L(n,n)=sqrt(A(n,n)-sum(L(n,1:n-1).^2));
y=L;

%%幂法
clear all;
clc;
A=[1 -3 2;4 4 -1;6 3 5];
y=[1 1 1]';
err=1;mu=norm(y,inf);
u=y/mu;
while err>1e-10
    muold=mu;
    y=A*u;
    mu=norm(y,inf);
    u=y/mu;
    err=abs(mu-muold);
end



