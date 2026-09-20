#include <stdio.h>
#include <math.h>

double f(double x, double y);

double RK4(double (*f)(double, double), double a, double b, double y0, int N, FILE *outfile) {
    double h = (b - a) / N;
    double x_0 = a;
    double y_0 = y0;
    double x, y;
    

    for (int i = 0; i < N; ++i) {
        double K1 = f(x_0, y_0);
        double K2 = f(x_0 + h / 2, y_0 + h * K1 / 2);
        double K3 = f(x_0 + h / 2, y_0 + h * K2 / 2);
        double K4 = f(x_0 + h, y_0 + h * K3);
        y = y_0 + h * (K1 + 2 * K2 + 2 * K3 + K4) / 6;
        x_0 += h;
        y_0 = y;
        fprintf(outfile, "%lf %lf\n", x_0, y_0);
    }
}

int main() {
   FILE *outfile=fopen("out.txt","w");
	int N;
	double a,b,y0;
	a=0.0;b=2.0;
	y0=0.5;
	N=10;
	RK4(f,a,b,y0,N,outfile);
	fclose(outfile);
 } 

double f(double x, double y) {
    return y - pow(x, 2) + 1;
}


