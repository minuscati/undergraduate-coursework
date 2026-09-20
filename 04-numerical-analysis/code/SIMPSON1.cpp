#include <stdio.h>
#include <math.h>
double CTR(int n, double a, double b, double (*f1)(double)) {
    double h = (b - a) / n;
    double F = 0;
    double T;

    for (int i = 1; i <= n-1; i++) {
        double x = a + i * h;
        F += 2 * f1(x);
    }

    T = (h / 2) * (f1(a) + f1(b) + F);
    return T;
}

double CSR(int n, double a, double b, double (*f2)(double)) {
	double h = (b - a) / n;
    double F = 0;
    double F1 = 0;
    double F2 = 0;
    double S;

    for (int i = 1; i < n; i++) {
        double x = a + i * h;
        if (i%2==0)
        {F1 += 2 * f2(x);}
		else
        {F2 += 4 * f2(x);}
    }
 	F=F1+F2;
    S = (h / 3) * (f2(a) + f2(b) + F);
    return S;
}

double f1(double x) {
    return 1 / (1 + sin(x) * sin(x));
}
double f2(double x) {
    return x * log10(x);
}

int main() {
    int n = 10;
    double a = 0.0;
    double b = 1.0;
    printf("f1的复合梯形公式积分为：%12.9e\n", CTR(n, a, b, f1));
    printf("f1的复合Simpson公式积分为：%12.9e\n", CSR(n, a, b, f1));
    
	int n1 = 8;
    double a1 = 1.0;
    double b1 = 2.0;
    printf("f2的复合梯形公式积分为：%12.9e\n", CTR(n1, a1, b1, f2));
    printf("f2的复合Simpson公式积分为：%12.9e\n", CSR(n1, a1, b1, f2));
    return 0;
}

