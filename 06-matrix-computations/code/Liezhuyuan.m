function [P, A] = Liezhuyuan(A)
    n = length(A);
    P = eye(n);  
    
    for k = 1:n-1
        [~, p] = max(abs(A(k:n, k))); 
        i1 = k + p - 1;
        
        %%对A进行行交换
        temp = A(k, :);
        A(k, :) = A(i1, :);
        A(i1, :) = temp;
        
        % 对置换矩阵P进行行交换
        temp = P(k, :);
        P(k, :) = P(i1, :);
        P(i1, :) = temp;
        
        if abs(A(k, k)) ~= 0 
            A(k+1:n, k) = A(k+1:n, k) / A(k, k);
            A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
        else
            error('矩阵奇异');
        end
    end
end




