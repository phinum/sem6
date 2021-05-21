#include <iostream>
using namespace std;

const long long int n = 1e6;
long long int a[n];

long long int getsmall(long long int x){
    x--;
    long long int total = 0;
    while (x > 0) {
        total += a[x];
        x -= x & (-x);
    }
    return total;
}

void increase(long long int x){
    long long int val = 1;
    while(x < n){
        a[x] += val;
        x += x & (-x);
    }
}

int main(){
    long long int n, x;
    cin >> n; 
    for(long long int i = 0; i < n; i++){
        cin >> x;
        cout << i - getsmall(x) << " ";
        increase(x);
    }
}
