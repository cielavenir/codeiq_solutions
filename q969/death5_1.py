#Py3 Only
from __future__ import print_function
for i in range(1,51):print('FIZZBUZZ' if i%15==0 else 'fizz' if i%3==0 else 'buzz' if i%5==0 else i,end='')