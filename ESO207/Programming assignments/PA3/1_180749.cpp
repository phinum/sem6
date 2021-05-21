#include <cmath>
#include <cstdio>
#include <climits>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

struct Node{
  int data;
  Node* left;
  Node* right;
};

Node* getnewnode(int x){
  Node* temp = new Node();
  temp -> data = x;
  temp -> left = temp -> right = NULL;
  return temp;
}

Node* insert(Node* root, int x){
  if(root == NULL){
    root = getnewnode(x);
  }else if(x <= root -> data){
    root -> left = insert(root -> left, x);
  }else{
    root -> right = insert(root -> right, x);
  }
  return root;
}

void preorder(Node* root){
  if(root == NULL){
    return;
  }
  cout << root -> data << " ";
  preorder(root -> left);
  preorder(root -> right);
}

void x(Node* root, int* p){
    if (root == NULL){
        return;
    }
    x(root->right, p);
    *p = *p + root->data;
    root->data = *p;
    x(root->left, p);
}

int main() {
    int n, b, p = 0;
    cin >> n;
    Node* root = NULL;
    cin >> b;
    root = insert(root, b);
    for(int i = 1; i < n; i++){
        cin >> b;
        insert(root, b);
    }
    x(root, &p);
    preorder(root);
    return 0;
}