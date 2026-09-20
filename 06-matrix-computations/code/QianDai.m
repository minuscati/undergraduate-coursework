function y=QianDai(L,b)
n=length(L);
for i=1:n-1
    b(i,1)=b(i,1)/L(i,i);
%     for j=i+1:n
%         b(j)=b(j)-L(j,i)*b(i);
%     end
     b(i+1:n,1)=b(i+1:n,1)-L(i+1:n,i)*b(i,1);
end
b(n,1)=b(n,1)/L(n,n);
y=b;
