#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int a[1001][1001], v[1001][1001], n, m;

int s(int i, int j){
    if((i >= 0) && (i < n) && (j >= 0) && (j < m) && (v[i][j] != a[i][j])){
        return 1;
    }else{
        return 0;
    }
}

void DFS(int i, int j){
    int c[4] = {0, -1, 0, 1};
    int r[4] = {-1, 0, 1, 0};
    v[i][j] = 1;
    for (int k = 0; k < 4; k++){
        if (s(i + r[k], j + c[k])){
            DFS(i + r[k], j + c[k]);
        }
    }
}

int isle(){
    int cnt = 0;
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            v[i][j] = 0;
        }
    }
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < m; ++j)
            if (a[i][j] != v[i][j]){
                DFS(i, j);
                cnt++;
            }
    return cnt;
}

int main() {
    cin >> n >> m;
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            cin >> a[i][j];
        }
    }
    cout << isle() << endl;
    return 0;
}
