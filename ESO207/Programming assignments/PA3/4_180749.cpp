#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

void ms(long long int a[] , long long int l , long long int r){
    if(l == r){
        return;
    }
    int m = (l + r) / 2 ;
    ms(a , l , m);
    ms(a , m + 1 , r);
    long long int x = m - l + 1; long long int y = r - m;
    long long int b[x]; long long int c[y] ;
    for(long long int i = l; i <= m; i++){
        b[i - l] = a[i] ;
    }
    for(long long int i = m+1; i <= r; i++){
        c[i - m - 1] = a[i] ;
    }
    
    long long int i = 0, j = 0, z = l ;
    while(i < x && j < y){
        if(b[i] < c[j]){
             a[z++] = b[i++] ;
        }else{
             a[z++] = c[j++] ;
        }
    }
    while(i < x){
        a[z++] = b[i++] ;
    }
    while(j < y){
        a[z++] = c[j++] ;
    }   
}

long long int bin(long long int b[] , long long int l , long long int r , long long int d){
    if (r >= l) {
        long long int m =  (r + l) / 2;
        if (b[m] == d){
            return m;
        }
        if (b[m] > d){
            return bin(b, l, m - 1, d);
        }
        return bin(b, m + 1, r, d);
    }
    return -1;
}

int main() {
    long long int n, m, f, cnt = 0, d, ix;  
    cin >> n ;
    long long int a[n];
    for(long long int i = 0; i < n; i++){
        cin >> a[i];
    } 
    cin >> m;
    long long int b[m];
    for(long long int i=0; i<m; i++){
        cin >> b[i];
    }
    cin >> f;
    ms(a, 0, n - 1);
    ms(b, 0, m - 1);
    for(long long int i=0; i < n ;i++){
        d = f - a[i];
        ix = bin(b, 0, m, d);
        if(ix!=-1)
            cnt++;
    }
    cout << cnt << endl ;
    return 0;
}