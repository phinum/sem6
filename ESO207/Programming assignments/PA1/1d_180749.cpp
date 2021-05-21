#include <iostream>
#include <time.h>
#include <cstdio>

using namespace std;

long long int single[2][2] = {{3,1},{1,3}};

void m(long long int a[2][2], long long int single[2][2], long long int b){
    long long int i, j, k, res[2][2];
    res[0][0] = 0; res[0][1] = 0; res[1][0] = 0; res[1][1] = 0;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 2; j++) {
            for (k = 0; k < 2; k++)
                res[i][j] += a[i][k] * single[k][j];
        }
    }
    a[0][0] = res[0][0] % b; a[0][1] = res[0][1] % b; a[1][0] = res[1][0] % b; a[1][1] = res[1][1] % b;
}

void power(long long int n, long long int a[2][2], long long int b){
    if(n == 1){
        return;
    }
    power(n/2, a, b);
    m(a, a, b);
    if(n % 2 != 0){
        m(a, single, b);
    }
}

int main()
{
    long long int n, a[2][2], b = 1e9+7;
    cin >> n;
    a[0][0] = 3; a[0][1] = 1; a[1][0] = 1; a[1][1] = 3;
    if(n == 0){
        cout << 1 << ", " << 0 << endl;
    }else{
        power(n, a, b);
        cout << a[0][0] << ", " <<  a[0][1] << endl;
    }
    return 0;
}