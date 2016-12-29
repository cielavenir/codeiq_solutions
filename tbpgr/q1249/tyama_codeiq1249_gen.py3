#!/usr/bin/env python3
import marshal,zlib,base64,sys
#code object
stage1=compile(sys.stdin.read(),'','exec',optimize=1)
#encode object
stage2=base64.b85encode(zlib.compress(marshal.dumps(stage1),9))
#loader
stage3="import marshal,zlib;exec(marshal.loads(zlib.decompress(base64.b85decode("+str(stage2)+"))))"
#encode loader
stage4="import base64;exec(base64.b85decode("+str(base64.b85encode(bytes(stage3,'ascii')))+"))"
print(stage4)
