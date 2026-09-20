clear all;
clc;
A=[2 1 2; 5 -1 1;1 -3 -4]; 
n=3;
P=eye(n);
for k = 1:n-1
        [~, i1] = max(abs(A(k:n, k))); 
        p = k + i1 - 1;
        
% Swap rows in A
        temp = A(k, :);
        A(k, :) = A(p, :);
        A(p, :) = temp;
        
        % Swap entries in permutation vector u
        temp = P(k, :);
        P(k, :) = P(p, :);
        P(p, :) = temp;
        
        if abs(A(k, k)) > 1e-10  % Check if pivot is close to zero
            A(k+1:n, k) = A(k+1:n, k) / A(k, k);
            A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
        else
            error('Pivot is zero or too close to zero, LU decomposition cannot proceed.');
        end
end
    
L = tril(A, -1) + eye(n);
U = triu(A);
b=[5 8 -4]';
y=QianDai(L,b);
x=HuiDai(U,y);
e1=norm(P*A*x-b,Inf);

        