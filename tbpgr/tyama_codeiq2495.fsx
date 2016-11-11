//usr/bin/env fsharpi $0 $@;exit
open System

let z=Console.ReadLine().Split(',')
let d=float(z.[1])/float(z.[0])
if d>1.0 then
 Console.WriteLine("invalid")
else
 Console.WriteLine(String(z.[2].[0],int(d*100.0)))