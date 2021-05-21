#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

vector <long long int> X,Y;

struct Node{
  long long int data;
  Node* left;
  Node* right;
};

Node* root;
Node* getnewnode(long long int x){
  Node* temp = new Node();
  temp -> data = x;
  temp -> left = temp -> right = NULL;
  return temp;
}

Node* insert(Node* root, long long int x){
  if(root == NULL){
    root = getnewnode(x);
  }else if(x <= root -> data){
    root -> left = insert(root -> left, x);
  }else{
    root -> right = insert(root -> right, x);
  }
  return root;
}

long long int searchx(Node* root, long long int x , long long int &ans){
  if(root == NULL){
    return 0;
  }else if(root -> data == x){
    ans ++ ;
    return ans;
  }else if(x <= (root -> data)){
    ans ++ ;
    searchx(root -> left, x , ans);
    return ans ;
  }else{
    ans ++ ;
    searchx(root -> right, x, ans);
      return ans ;
  }
}
bool searchy(Node* root, long long int x){
  if(root == NULL){
    return false;
  }else if(root -> data == x){
    Y.push_back(root -> data);
    return true;
  }else if(x <= root -> data){
    Y.push_back(root -> data);
    return searchy(root -> left, x);
  }else{
    Y.push_back(root -> data);
    return searchy(root -> right, x);
  }
}

int main() {
    root = NULL;
    long long int n, k, b;
    cin >> n >> k;
    for(long long int i = 0; i < n; i++){
        cin >> b;
        root = insert(root, b);
    }
    for(long long int i = 0; i < k; i++){
        long long int u , v ;
        cin >> u >> v ;
        Node* curr = root ;
        long long int curr_val = (curr -> data) ;
        while(((u - curr_val)*(v - curr_val)) > 0){
            if(u - curr_val > 0){
                curr = (curr -> right) ;
                curr_val = (curr -> data) ;
            }
            else{
                curr = (curr -> left) ;
                curr_val = (curr -> data) ;
            }
        }
        long long int ans1 = 0 ;
        searchx(curr , u , ans1) ;
        long long int ans2 = 0 ;
        searchx(curr , v , ans2) ;
        //cout << ans1 << ' ' << ans2 << endl ;
        cout << (ans1 + ans2 - 1) << '\n' ;
    }
    
    return 0;
}
