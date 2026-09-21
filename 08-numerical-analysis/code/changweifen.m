clear all;
clc;
% options=odeset('Reltol',1e-4,'Refine',1,'Maxstep',1);
% [x,y]=ode45(@(x,y)-2*y-4*x,[0 1],2,options);
% 
options=odeset('Reltol',1e-4,'Refine',1,'Maxstep',0.2);
[x,y]=ode45(@(x,y)y-x^2+1,[0 2],0.5,options)
ANSWER(:,1)=x(:,1);
ANSWER(:,2)=y(:,1);