#!/usr/bin/python
#coding:utf-8
s='hnggdtraaeaeeu'
l=(len(s)+1)//2
print(''.join(''.join(e) for e in zip(s[:l],s[l:])))
#私の場合、手で摘んで引き抜いてますが、マシューはどうなんだろう…。