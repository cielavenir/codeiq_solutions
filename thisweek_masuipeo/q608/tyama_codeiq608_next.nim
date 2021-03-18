#[
/usr/bin/env nim c --nimcache:$HOME/.nimcache --opt:speed --run $0 $@;exit
#]#

import algorithm
import sequtils

proc my_next_permutation[T](a:var seq[T],n0:ref int=nil):bool =
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
 for i in countup(0,N*2-1): e[i+1]=e[i]+e0[i]
 #数学の座標系のように左下をA、右上をBとすると、eの各インデックスiにおいて、x座標がi-e[i]、y座標がe[i]となる。
 while true:
  for i in countup(0,N*2-1): f[i+1]=f[i]+f0[i]
  block blk:
   for i in countup(0,N*2-1):
    if e[i]==f[i] and e[i+1]==f[i+1]:
     break blk
   r+=1
  #i番目の座標とi+1番目の座標が等しければ、「道に重複がある」とみなせる。
  if not my_next_permutation(f0): break
 if not my_next_permutation(e0): break
writeLine(stdout,r) # 100360
