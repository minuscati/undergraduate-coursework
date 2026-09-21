#include <stdio.h>
void main()
{
	while(i<N)
	{
		x_1=newton(x_0,f,f_d);
		if(fabs(x_1-x_0)/(1+fabs(x_1))<epsilon)
		{
			printf("迭代步数=%d,近似值=%f\n",i,x_1);
			break;
		}
		x_0=x_1;
		i=i+1;
	}
	if(i>N)
	printf("超过最大迭代次数"); 
 } 
