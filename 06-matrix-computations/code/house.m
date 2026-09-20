%%Householder
function [v,b]=house (x)
n=length(x);
m=norm(x,inf);%%m是yeta
sigma=x(2:n)'*x(2:n);
v(2:n)=x(2:n);
v=v';
if sigma==0
    b=0;
else
    alpha=sqrt(x(1)^2+sigma);
    if x(1)<=0
        v(1)=x(1)-alpha
    else
        v(1)=-sigma/(x(1)+alpha);
    end
    b=2*v(1)^2/(sigma+v(1)^2);
    v=v/v(1);
end
end
