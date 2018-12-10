#!/usr/bin/python
import sys,itertools
import sympy

print(sum(itertools.islice((i for i in itertools.count(4) if not sympy.ntheory.primetest.isprime(i)),int(sys.stdin.readline()))))
