//usr/bin/env fsharpi $0 $@;exit
open System
let mutable s=Console.ReadLine()
let starting:int64=5L
let bse:int64=10L
while s<>null do
 let mutable n=int64(s)+starting-2L
 let mutable digits=1L
 let mutable expbase=1L
 let mutable x=bse-1L
 while x<=n do
  n<-n-x
  digits<-digits+1L
  expbase<-expbase*bse
  x<-digits*expbase*(bse-1L)
 let mutable num=expbase+n/digits
 let mutable d=digits-1L-n%digits
 for i in 1L..d do
  num<-num/bse
 Console.WriteLine(num%bse);
 s<-Console.ReadLine()