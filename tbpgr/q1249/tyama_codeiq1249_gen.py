#!/usr/bin/env python
import marshal,zlib,base64,sys
#code object
stage1=compile(sys.stdin.read(),'','exec')
#encode object
stage2=base64.b64encode(zlib.compress(marshal.dumps(stage1),9))
#loader
stage3="import marshal,zlib;exec(marshal.loads(zlib.decompress(base64.b64decode('"+stage2+"'))))"
#encode loader
stage4="import base64;exec(base64.b64decode('"+base64.b64encode(stage3)+"'))"
print(stage4)
