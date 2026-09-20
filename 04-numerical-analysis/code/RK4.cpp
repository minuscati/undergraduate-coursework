#include <stdio.h>
#include <math.h>
double RK4(double *f,double a,double b,double y0,int N,FILE *outfile){
	double h=(b-a)/N;
	f=y-pow(x,2)+1;
	K1=f(x_0,y_0);
	K2=f(x_0+h/2,y_0+h*K1/2);
	K3=f(x_0+h/2,y_0+h*K2/2);
	K4=f(x_0+h,y_0+h*K3);
	y_1=y_0+h*(K1+2*K2+2*K3+K4)/6;
}

void main()
{
	FILE *outfile=fopen("out.txt","w");
	int N;
	double a,b,y0;
	a=0.0;b=2.0;
	y=0.5;
	N=10;
	RK4(f,a,b,y0,N,outfile);
	fclose(outfile);
 } 
