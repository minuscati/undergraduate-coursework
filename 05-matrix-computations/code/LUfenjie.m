%%LUfenjie
function y=LUfenjie(A)
n=length(A);
%A = [1 4 7; 2 5 8; 3 6 10];
for k = 1:n-1
    A(k+1:n, k) = A(k+1:n, k) / A(k, k);
    A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
end
y=A;


