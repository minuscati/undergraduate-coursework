%%Cholesky
function y=Cholesky(A)
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

