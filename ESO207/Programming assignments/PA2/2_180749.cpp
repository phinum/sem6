#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

long long int count(long long int a[], long long int b[], long long int n, long long int m, long long int num){
    long long int j = 0, i = n-1, x, cnt=0; 
    while(i >= 0 && j < m){
        x = a[i]*b[j];
        if(x > num){
            i--;
        }else{
            cnt += i+1;
            j++;
        }
    }
    return cnt;
}

long long int binarysearch(long long int a[], long long int b[], long long int n, long long int m, long long int k){
    long long int min = a[0]*b[0], max = a[n-1]*b[m-1], mid, num,ans;
    while(min <= max){
        mid = (min + max) / 2;
        num = count(a, b, n, m, mid);
        if(num >= k){
            max = mid - 1;
            ans = mid;
        }else{
            min = mid+1;
        }
    }
    return ans;
}

int main() {
    long long int n,m,f,k, ans;
    cin >> n >> m;
    long long int a[n], b[m];
    for(long long int i = 0; i < n; i++){
        cin >> f;
        a[i] = f;
    }
    for(long long int i = 0; i < m; i++){
        cin >> f;
        b[i] = f;
    }
    cin >> k;
    ans = binarysearch(a, b, n, m, k);
    cout << ans << endl;
    return 0;
}