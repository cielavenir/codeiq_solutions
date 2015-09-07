#include <iostream>
#include <string>
using namespace std;
int main(){
string a="GTGT",b=a+a+"GTT"+a+"TTGTT",c="TTTFGTTTT"+b+"TWWTTWG"+b+"FGGWMTMTGGTWGGTTGGTTMWGGWGTTMGGM";
for(auto&e:c)cout<<(e=='T'?"tree":e=='F'?"fire":e=='G'?"gold":e=='W'?"water":"moon");
}