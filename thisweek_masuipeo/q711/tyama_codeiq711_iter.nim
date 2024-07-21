#[
/usr/bin/env nim c --nimcache:$HOME/.nimcache --opt:speed --run $0 $@;exit
#]#

import algorithm
import sequtils

proc unique_permutation[T](a0:seq[T],n0:ref int=nil):iterator:seq[T] =
 return iterator:seq[T] =
  var n=len(a0)
  if n0!=nil:
   n=n0[]
  if n<0 or len(a0)<n: return
  var a=a0.sorted
  while true:
   yield a[0..n-1]
   a=concat(a[0..n-1],a[n..len(a)-1].reversed)
   var k = -1
   block blk:
    for i in countdown(len(a)-2,0):
     if a[i]<a[i+1]:
      k=i
      break blk
    #a.reverse
    return
   for l in countdown(len(a)-1,k):
    if a[k]<a[l]:
     let z=a[k]
     a[k]=a[l]
     a[l]=z
     break
   a=concat(a[0..k],a[k+1..len(a)-1].reversed)

let N=6
var e0=concat(repeat(0,N),repeat(1,N))
var f0=concat(repeat(0,N),repeat(1,N))
#各Pは経路を表す。1が縦、0が横を表す。
var r=0
var e=repeat(0,N*2+1)
var f=repeat(0,N*2+1)
for e1 in unique_permutation(e0):
 for f1 in unique_permutation(f0):
  var flg=0
  var zero1=0
  var zero2=N
  var one1=0
  var one2=N
  for i in countup(0,N*2-1):
   zero1 += (if e1[i]==0: 1 else: 0)
   one1  += (if e1[i]==1: 1 else: 0)
   zero2 -= (if f1[N*2-1-i]==0: 1 else: 0)
   one2  -= (if f1[N*2-1-i]==1: 1 else: 0)
   if zero1==zero2: flg+=1
   if one1==one2: flg+=1
  if flg>=2: r+=1
writeLine(stdout,r) # 527552
