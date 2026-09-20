A=[1 -1 1;5 -4 3;2 1 1];
b=[-4 -12 11]';
A=[A,b];
n=length(b);
% for k=1:(n-1)
%     [Ap,p]=max(abs(A(k:n,k)));p=p+k-1;
%     if p>k,
%         t=A(k,:);A(k,:)=A(p,:);A(p,:)=t;
%     end
%     end
for k=1:(n-1)%eliminate
    j=(k+1):n;jj=(k+1):(n+1);
    [Ap,p]=max(abs(A(j,k)));p=k+p;
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
    
    

