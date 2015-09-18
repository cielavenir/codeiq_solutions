#!/usr/bin/ruby
while s=gets do n=s.to_i;break if n==0;r=0;i=1;(i+=1;r+=n/i if n%i==0)while(n-=i)>0;p r end