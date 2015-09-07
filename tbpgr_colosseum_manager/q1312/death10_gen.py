#!/usr/bin/python3
import subprocess,zlib,base64
data=b'treetreetreefiregoldtreetreetreetreegoldtreegoldtreegoldtreegoldtreegoldtreetreegoldtreegoldtreetreetreegoldtreetreetreewaterwatertreetreewatergoldgoldtreegoldtreegoldtreegoldtreegoldtreetreegoldtreegoldtreetreetreegoldtreetreefiregoldgoldwatermoontreemoontreegoldgoldtreewatergoldgoldtreetreegoldgoldtreetreemoonwatergoldgoldwatergoldtreetreemoongoldgoldmoon'

x=subprocess.check_output(['zlibrawstdio','c9'],input=data)
#x=zlib.compress(data,9)

#Py3
print('import zlib,base64;print(zlib.decompress(base64.b85decode("'+base64.b85encode(x).decode()+'")).decode())',end='')
#Py2
#print('import zlib,base64;print zlib.decompress(base64.b64decode("'+base64.b64encode(x).decode()+'"))',end='')