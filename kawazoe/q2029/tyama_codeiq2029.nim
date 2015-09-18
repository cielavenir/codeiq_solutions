#!/usr/bin/env nim
import strutils
while true:
 var s=readLine(stdin)
 if s=="":
  break
 #if not readLine(stdin,s):
 # break
 var n=cast[int64](parseBiggestInt(s))
 if n==0:
  break
 var r=cast[int64](0)
 var i=cast[int64](2)
 while true:
  var x=n-(i*(i-1) div 2)
  if x<i:
   break
  if x mod i==0:
   r=r+(x div i)
  i=i+1
 echo(r)