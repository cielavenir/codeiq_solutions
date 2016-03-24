//usr/bin/env fsharpi $0 $@;exit
open System
let a=Console.ReadLine().Split('.')
let mutable x=int(a.[0])
let mutable y=int(char(a.[1]))-68
let z=int(a.[2])
if y<2 then
 x<-x-1
 y<-y+11
Console.WriteLine(char((6+2*x-x/20+x/80-x/4000+z+219*y/7)%7+116))