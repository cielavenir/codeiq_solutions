#!/usr/bin/python
#coding:utf-8
#Note: rpython version does not support processed input.
import sys
try:
	import rpython.rlib.streamio
	stdin=rpython.rlib.streamio.fdopen_as_stream(sys.stdin.fileno(),'r')
	def warn(msg): pass
except ImportError:
	if True: #Set to False if you use raw txt
		import bz2,binascii
		data=bz2.decompress(binascii.a2b_base64(sys.stdin.read()))
		if sys.version_info[0]>=3:
			stdin=__import__('io').StringIO(data.decode())
		else:
			stdin=__import__('StringIO').StringIO(data)
	else:
		stdin=sys.stdin
	def warn(msg): sys.stderr.write(msg)

def entry_point(argv):
	global stdin
	try:
		while True:
			id,_n,_data,_answer=stdin.readline().rstrip().split("\t")
			#if id[0]!='T': break
			n=int(_n)
			answer=int(_answer)
			if len(_data)==2:
				if 2!=answer: print(id)
			elif answer>0 and n%answer>0:
				warn(id+": answer cannot divide n\n")
				print(id)
			else:
				#単位円の1周を360度ではなく「2n単位」とする。これにより整数演算が可能になる。
				data=[[2*(ord(f)-65) for f in e] for e in _data.split(',')]
				ans=0
				for i in range(n):
					data=[[(f+1)%(2*n) for f in e] for e in data]
					for e in data:
						x=[-f%(2*n) for f in e]
						if x not in data:
							x.reverse()
							if x not in data: break
					else:
						ans+=1
				if ans!=answer: print(id)
	except EOFError: pass
	except ValueError: pass # RPython
	return 0

def target(*args): return entry_point
if __name__=='__main__': entry_point(sys.argv)

'''
Python3 0.38s
PyPy    0.36s
Python2 0.27s
RPython 0.02s
'''