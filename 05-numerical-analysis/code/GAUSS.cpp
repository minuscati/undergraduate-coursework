#include <stdio.h>
#include <math.h>
#define n 3

int main() {
    double a[n+1][n+1] = {{0,0,0,0},
                          {0,0.2641,0.1735,0.8642},
                          {0,0.9411,-0.0175,0.1463},
                          {0,-0.8641,-0.4243,0.0711}};
                          
    double b[n+1] = {0,-0.7521,0.6310,0.2501};
    double l[n+1][n+1], x[n+1], sum;
    int k, i, j, p, ll;

    for (k = 1; k <= n-1; k++) {
        p = k;
        for (i = k+1; i <= n; i++) {
            if (fabs(a[i][k]) > fabs(a[p][k]))
                p = i;
        }
        // 交换第 p 行和第 k 行
        for (j = 1; j <= n; j++) {
            double temp = a[p][j];
            a[p][j] = a[k][j];
            a[k][j] = temp;
        }
        double temp = b[p];
        b[p] = b[k];
        b[k] = temp;

        // 进行消元
        for (i = k+1; i <= n; i++) {
            l[i][k] = a[i][k] / a[k][k];
            b[i] = b[i] - l[i][k] * b[k];
            for (j = k+1; j <= n; j++) {
                a[i][j] = a[i][j] - l[i][k] * a[k][j];
            }
        }
    }

    // 回代计算解
    x[n] = b[n] / a[n][n];
    for (k = n-1; k >= 1; k--) {
        sum = 0;
        for (ll = k+1; ll <= n; ll++) {
            sum = sum + a[k][ll] * x[ll];
        }
        x[k] = (b[k] - sum) / a[k][k];
    }

    printf("方程的解为：\n");
    for (k = 1; k <= n; k++) {
        printf("x[%d] = %f\n", k, x[k]);
    }

    return 0;
}

