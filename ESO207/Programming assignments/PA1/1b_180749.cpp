#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

long long int U(long long int n);
long long int D(long long int n);

long long int D(long long int n){
    long long int a = 1e9+7;
    if(n == 0){
        return 0;
    }
    return ((U(n-1))%a + (3*D(n-1))%a)%a;
}

long long int U(long long int n){
    long long int a = 1e9+7;
    if(n == 0){
        return 1;
    }
    return (3*U(n-1)%a + D(n-1)%a)%a;
}

int main() {
    long long int n; 
    cin >> n;
    cout << U(n) << endl;
    return 0;
}