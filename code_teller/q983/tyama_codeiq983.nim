#[
/usr/bin/env nim c --nimcache:$HOME/.nimcache --opt:speed --run $0 $@;exit
#]#
import strutils
var starting=5
var bse=10
var s=""
while stdin.readLine(s):
 var n=parseBiggestInt(s)
 n=n+starting-2
 var digits:int64=1
 var expbase:int64=1
 var x:int64=bse-1
 while x<=n:
  n=n-x
  digits=digits+1
  expbase=expbase*bse
  x=digits*expbase*(bse-1)
 var num=expbase+n div digits
 var d=digits-1-n mod digits
 while d>0:
  num=num div bse
  d=d-1
 echo(num mod bse)
