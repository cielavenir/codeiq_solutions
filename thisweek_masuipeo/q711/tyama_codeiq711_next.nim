#[
/usr/bin/env nim c --nimcache:$HOME/.nimcache --opt:speed --run $0 $@;exit
#]#

import algorithm
import sequtils

proc next_permutation[T](a:var seq[T],n0:ref int=nil):bool =
 var n=len(a)
 if n0!=nil:
  n=n0[]
 if n<0 or len(a)<n: return false
 a=concat(a[0..n-1],a[n..len(a)-1].reversed)
 var k = -1
 block blk:
  for i in countdown(len(a)-2,0):
   if a[i]<a[i+1]:
    k=i
    break blk
  a.reverse
  return false
 for l in countdown(len(a)-1,k):
  if a[k]<a[l]:
   let z=a[k]
   a[k]=a[l]
   a[l]=z
   break
 a=concat(a[0..k],a[k+1..len(a)-1].reversed)
 return true

let N=6
var e0=concat(repeat(0,N),repeat(1,N)).sorted
var f0=concat(repeat(0,N),repeat(1,N)).sorted
#各Pは経路を表す。1が縦、0が横を表す。
var r=0
var e=repeat(0,N*2+1)
var f=repeat(0,N*2+1)
while true:
 while true:
  var flg=0
  var zero1=0
  var zero2=N
  var one1=0
  var one2=N
  for i in countup(0,N*2-1):
   zero1 += (if e0[i]==0: 1 else: 0)
   one1  += (if e0[i]==1: 1 else: 0)
   zero2 -= (if f0[N*2-1-i]==0: 1 else: 0)
   one2  -= (if f0[N*2-1-i]==1: 1 else: 0)
   if zero1==zero2: flg+=1
   if one1==one2: flg+=1
  if flg>=2: r+=1
  if not next_permutation(f0): break
 if not next_permutation(e0): break
writeLine(stdout,r) # 527552
