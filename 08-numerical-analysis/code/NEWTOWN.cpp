#include <stdio.h>
#include <math.h>
#define PI acos(-1)

double newton(double x, double y, double y0) {
    double x_1 = x - y / y0;
    return x_1;
}

int main() {
    double x_0 = 2.3;
    double epsilon = 0.5 * pow(10, -4);
    double f, f_d, x_1;
    int i = 1;
    int N = 100;

    while (i < N) {
        //f = pow(x_0, 3) - 3 * x_0 - 1;
        //f_d = 3 * pow(x_0, 2) - 3;
        f=x_0-tan(x_0);
        f_d=1-1/(pow(cos(x_0),2));
//        f=pow(2,x_0)-4*x_0;
//        f_d=pow(2,x_0)*log(2)-4;

        x_1 = newton(x_0, f, f_d);
        if (fabs(x_1 - x_0) / (1 + fabs(x_1)) < epsilon) {
            printf("迭代步数=%d, 近似值=%f\n", i, x_1);
            break;
        }

        x_0 = x_1;
        i = i + 1;
    }

    if (i >= N)
        printf("超过最大迭代次数\n");

    return 0;
}

