catalan(n)=binomial(2*n,n+1)/n
f(n)=print(if(n%2==0,0,catalan((n-1)\2)))
f(input())