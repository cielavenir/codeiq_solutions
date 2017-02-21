#!/usr/bin/python
#coding:utf-8
from __future__ import division,print_function
import sys
if sys.version_info[0]>=3: raw_input=input
dividend, divisor = map(int, raw_input().split())
try:
	print(dividend//divisor)
except ZeroDivisionError as e:
	print("ERR")