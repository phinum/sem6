#include <iostream>
#include <cstdio>
#include <time.h>

using namespace std;

int main()
{
    long long int n, U = 1, D = 0, rem = 0, a = 1e9+7;
    cin >> n;
    for(long long int i = 0; i < n; i++){
        rem = U;
        U = ((3*U)%a + D%a)%a;
        D = (rem%a + (3*D)%a)%a;
    }
    cout << U%a << endl;
    return 0;
}