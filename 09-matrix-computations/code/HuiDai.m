%huidai
function y=HuiDai(U,y)
n=length(U);
for j=n:-1:2
    y(j)=y(j)/U(j,j);
    y(1:j-1)=y(1:j-1)-U(1:j-1,j)*y(j);
end
y(1,1)=y(1,1)/U(1,1);
y=y;
