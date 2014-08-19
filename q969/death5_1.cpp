#import<stdio.h>
int i;main(){for(;++i<51;)printf(i%15==0?"FIZZBUZZ":i%3==0?"fizz":i%5==0?"buzz":"%d",i);}