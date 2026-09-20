function x=gausslzy(A,b)
n=length(b);
A=[A,b],
for k=1:(n-1)%eliminate
    j=(k+1):n;jj=(k+1):(n+1);
%     [Ap,p]=max(abs(A(j,k)));p=k+p;
%     if abs(A(k,k))/Ap<1
   [Ap,p]=max(abs(A(k:n,k)));p=k+p-1;
   if p>k
       A([k p],:)=A([p k],:);
    end
    A(j,jj)=A(j,jj)-A(j,k)/A(k,k)*A(k,jj);
    A(j,k)=zeros(n-k,1);
    A
end  
x=zeros(n,1);
x(n)=A(n,n+1)/A(n,n);%backsubstitute
for k=n-1:-1:1
    j=(k+1):n;
    x(k)=(A(k,n+1)-A(k,j)*x(j))/A(k,k);
end
end
A=[0.2641 0.1735 0.8642;0.9411 -0.0175 0.1463;-0.8641 -0.4243 0.0711];
b=[-0.7521 0.6310 0.2501]';