#!/usr/bin/python

checkio=lambda data: ['','M','MM','MMM'][data//1000]+['','C','CC','CCC','CD','D','DC','DCC','DCCC','CM'][data//100%10]+['','X','XX','XXX','XL','L','LX','LXX','LXXX','XC'][data//10%10]+['','I','II','III','IV','V','VI','VII','VIII','IX'][data%10]

import sys
if sys.version_info[0]>=3: raw_input=input
n=int(raw_input())
print(sum(len(checkio(i))==n for i in range(1,4000)))