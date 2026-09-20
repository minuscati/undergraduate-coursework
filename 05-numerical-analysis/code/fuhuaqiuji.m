clear all;
clc;
fun=@(x)(1./(1+(sin(x).^2)));
q1=quad(fun,0,1);
fun1=@(x)(x.*log10(x));
q2=quad(fun1,1,2);