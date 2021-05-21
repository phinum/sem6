#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <cassert>
#include <algorithm>
using namespace std;

struct RBTree{
    struct RBTree  *left, *right;
    long long int val;
};

struct RBTree * search(struct RBTree *head, long long int x){
    if(head == NULL) return NULL;
    if(head->val == x) return head;
    if(head->val < x) return search(head->right, x);
    else return search(head->left,x);
}

void insert(struct RBTree * head, long long int x){
    if(head->left == NULL && head->right == NULL){
        struct RBTree * node= (struct RBTree *)malloc(sizeof(struct RBTree));
        node->left = node->right = NULL;
        node->val = x;
        if(head->val < x) head->right = node;
        else head->left = node;
        return;
    }
    if(head->left == NULL && head->val >= x){
        struct RBTree * node = (struct RBTree *)malloc(sizeof(struct RBTree));
        node->left = node->right = NULL;
        node->val = x;
        head->left = node;
        return;
    }
    if(head->right == NULL && head->val <= x){
        struct RBTree * node = (struct RBTree *)malloc(sizeof(struct RBTree));
        node->left = node->right = NULL;
        node->val = x;
        head->right = node;
        return;
    }
    if(head->val <= x) insert(head->right, x);
    else insert(head->left, x);
}

// struct RBTree * del(struct RBTree* head, pair<long long int x){
//     if(head == NULL) return head;
//     if(x < head->val) return del(head->left, x);
//     else if(x > head->val) return del(head->right, x);
//     else{
//         if(head->left == NULL){
//             struct RBTree* temp = head->right;
//             free(head);
//             return temp;
//         }else if(head->right == NULL){
//             struct RBTree *temp = head->left;
//             free(head);
//             return temp;
//         }else{
//             struct RBTree *temp = head->right;
//             while(temp->left != NULL) temp = temp->left;
//             head->val = temp->val;
            
//             head->right = del(head->right, temp->val);
//         }
        
//     }
//     return head;
// }
long long int lb = (long long int)(1e18L);
void lower_bound(struct RBTree *head, long long int x){
    if(head == NULL) return;
    if(head->val >= x){
        lb = min(lb , head->val);
        lower_bound(head->left,x);
    }else{
        lower_bound(head->right,x);
    }
}

int main() {
    long long int n;
    long long int k;
    cin >> n;
    long long int a[n], pr[n+1];
    
    pr[0]=0;
    for(long long int i=0;i<n;++i){
        cin >> a[i];
        pr[i+1] = pr[i] + a[i];
    }
    cin >> k;
    if(n<=10){
        long long ans = (long long)1e18;
        for(int i=0 ; i<n ; i++){
            for(int j = i; j<n ; j++){
                long long sm = 0;
                for(int k = i ; k<= j ; k++){
                    sm += a[k];
                }
                if(sm>k)ans = min(ans,sm);
            }
        }
        cout<<(ans==(long long)1e18 ? -1 : ans);
        return 0;
    }
    
    long long int ans = (long long int)(1e18L);
    struct RBTree * head = (struct RBTree *)malloc(sizeof(struct RBTree));
    head->val = pr[n];
    head->left = head->right = NULL;
    for(long long int i=n-1;i>0;--i){
        lb = (long long int)(1e18L);
        lower_bound(head, pr[i]+k+1);
        if(lb != (long long int)(1e18L)){
            ans = min(ans , lb - pr[i]);
            //cout << lb.first << ' ' << lb.second << ' ' << i << '\n';
        }
        insert(head , pr[i]);
    }
    if(ans == (long long int)(1e18L)) ans = -1;
    cout << ans;
    return 0;
}
