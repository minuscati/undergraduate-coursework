%%复合梯形
clear all;
clc;
h=1/8;
x=linspace(0,1,9)';
y=exp(-(x.^2));
T8=(h/2)*(y(1,1)+y(end,1)+2*sum(y(2:end-1,1)));
%%复合SIMPSON
S8=(h/3)*(y(1,1)+y(end,1)+4*sum(y(2:2:end-1,1))+2*sum(y(3:2:end-2,1)));
