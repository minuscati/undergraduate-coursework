#include <stdio.h>
#include <math.h>
#define m 8
double lagrange
(double x[],double y[],double x0,int n)
{
	double Ln=0,l;
	for (int i=0;i<n;i++){
		l=1;
		for (int j=0;j<m;j++){
			if(j!=i){
				l=l*(x0-x[j])/(x[i]-x[j]);
			}		
		}
		Ln=Ln+l*y[i];
	
	}
	return Ln;
}

int main()
{
	double x[]={0.5,0.7,0.9,1.1,1.3,1.5,1.7,1.9};
	double y[]={0.48,0.64,0.78,0.89,0.96,1.00,0.99,0.95};
	double a[]={0.74,1.6,0.55,1.2,1.85};
	double Ln[]={0,0,0,0,0};
	int n=8;
	for (int i=0;i<5;i++)
	{
		Ln[i]=lagrange(x,y,a[i],n);
		printf("Ln[%6.3f]= %12.8e\n", a[i], Ln[i]);
	}
	return 0;
}

