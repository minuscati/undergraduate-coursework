clear all;
clc;
x=[3 0 4]';
xf=x;
n=length(x);
eta=norm(x,inf);x=x/eta;
sigma=sum(x(2:n).^2);
v=zeros(n,1);
v(2:n)=x(2:n);
if sigma==0
    beta=0;
else
    alpha=sqrt(x(1)^2+sigma);
    if x(1)<=0
        v(1)=x(1)-alpha;
    else
        v(1)=-sigma/(x(1)+alpha);
    end
    beta=2*v(1)^2/(sigma+v(1)^2);v=v/v(1);
end
% [v,b]=house (x);
I=eye(n);
H=I-beta*v*v';
H*xf
%%-----------------------------------
% clear all;
% clc;
% x=[3 4]';
% [c s]=givens(3,4);

% n=length(x);
% m=norm(x,inf);%%m是yeta
% sigma=x(2:n)'*x(2:n);
% v(2:n)=x(2:n);
% v=v';
% if sigma==0
%     b=0;
% else
%     alpha=sqrt(x(1)^2+sigma);
%     if x(1)<=0
%         v(1)=x(1)-alpha
%     else
%         v(1)=-sigma/(x(1)+alpha);
%     end
%     b=2*v(1)^2/(sigma+v(1)^2);
%     v=v/v(1);
% end
% I=eye(n);
% H=I-b*v*v';
% H*x



