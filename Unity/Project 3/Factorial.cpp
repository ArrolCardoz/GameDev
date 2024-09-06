#include <iostream>
using namespace std;

int fac(int n){
    int factortial = 1 ;
    for(int i = 2; i<=n;i++)
    {
     factortial *= i;
    }
    return factortial;
}

int main (){
    int n,r;
    cin>> n>>r;

    int ans = fac(n)/(fac(r)*fac(n-r));
    cout<<ans<<endl;
    return 0;

}