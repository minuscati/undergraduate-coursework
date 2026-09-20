#include <stdio.h>
#include <math.h>
#define m 2
void gauss(double a[m+1][m+1],double b[m+1],double x[m+1])

{      double l[m+1][m+1];
       double sum;
    	int i,j,k;

 for (k=0;k<=m-1;k++)
{                                                           
     for (i=k+1;i<=m;i++)
     {
         l[i][k]=a[i][k]/a[k][k];
         b[i]=b[i]-l[i][k]*b[k];
 
         for (j=k+1;j<=m;j++)
            {
           a[i][j]=a[i][j]-l[i][k]*a[k][j];
  
             }
     }
}

x[m]=b[m]/a[m][m];

 for (k=m-1;k>=0;k--)
{
    sum=0;
   for (j=k+1;j<=m;j++)
    {
    sum=sum+a[k][j]*x[j];
    }  
   
     x[k]=(b[k]-sum)/a[k][k];

}

int main
{
	double A[3][3]={{0,0,0},
					{0,0,0},
					{0,0,0}};
	double x[]={0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9};
	double y[]={5.1234,5.3057,5.5680,5.9378,6.4370,7.0978,7.9493,9.0253,10.3627}; 
	for (int i=0;i<10;i++){
		A[0][0]=A[0][0]+1;
		A[0][1]=A[0][1]+x[i];
		A[0][2]=A[0][2]+x[i]^2;
		A[1][2]=A[1][2]+x[i]^3;
		A[2][2]=A[2][2]+x[i]^4;
		
		A[1][0]=A[0][1];
		A[1][1]=A[0][2];
		A[2][0]=A[0][2];
		A[2][1]=A[1][2];
	}
	printf(A); 
	return 0 ;
	
}
	
		
	
