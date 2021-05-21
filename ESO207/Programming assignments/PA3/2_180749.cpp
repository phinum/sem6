#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int a[1001][1001], n, m;

int v(int x, int y){
    return (int)(x >= 0 && y >= 0 && x < n && y < m);
}

int cov(){
    int c[4] = {0,-1,0,1};
    int r[4] = {-1,0,1,0};
    int x[n*m], y[n*m], t[n][m], k = 0;
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            if(a[i][j] != 0){
                t[i][j] = -1;
            }else{ 
                t[i][j] = 0;
            }
            if(a[i][j] == 2){ 
                t[i][j]=0;
                x[k] = i;
                y[k] = j;
                k++;
            }
        }
    }
    int g = 0, h = 0;
    while(h < k){
        for(int i = 0; i < 4; i++){
            int q = x[h] + r[i], r = y[h] + c[i];
            if(v(q, r)){
                if(a[q][r] == 1){
                    t[q][r] = t[x[h]][y[h]] +1 ;
                    a[q][r] = 2;
                    if(g < t[q][r]){
                        g = max(g , t[q][r]);
                    }
                    x[k] = q;
                    y[k] = r;
                    k++;
                }
            }
        }
        h++;
    }
    for(int i = 0 ; i < n; i++){
        for(int j = 0 ; j < m; j++){
            if(t[i][j] == -1){
                return -1;
            }
        }
    }
    return g;
}

int main(){
    cin >> n >> m;
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            cin >> a[i][j];
        }
    }
    cout << cov() << endl;
    return 0;
}