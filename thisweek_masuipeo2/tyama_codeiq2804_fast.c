#include <stdio.h>
int main(){long long n;scanf("%lld",&n);printf("%lld\n",1LL<<__builtin_ctzll(~n));}
