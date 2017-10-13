#include <iostream>
#include "add.hpp"
#include "sub.hpp"
using namespace std;

int main(void)
{
  int sum, dif, a, b;
  while(cin >> a >> b, a){
    sum = add(a, b);
    dif = sub(a, b);
    cout << "sum: " << sum << endl;
    cout << "dif: " << dif << endl;
  }
  
  return 0;
}
