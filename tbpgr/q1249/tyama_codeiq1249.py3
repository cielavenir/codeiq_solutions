#!/usr/bin/python3
import base64;exec(base64.b85decode(b'X>D+Ca&#bVVRCb5VQegVY-wUUWq4&{C~aYKb7)~~E^KdMWOFEbY-wUHWMyM-ZE$jBb8{$SVRL0RG%jK|HDqODZ)9aCVkcuQZfPrKLr#7;Dq%AzC@FDqG*K}$Iaz&7Y<fUUL}_D2Fh^x!e0L>2a5!~1OGrFcXI?*Qcx-ATKXqn(Vp(xTAxmmzB`HQZSw&28DNtlVLM1#=a4md$X=6WQJ$5l+LQ8BUP&rIRX+>98MQ$@qKO-?QaaT`xBsnP~VoH56a7bxFS6NasaV9ocSVBNkElYZFCn+f@DF'))

'''
import marshal,zlib,base64
#code object
stage1=compile('print(" ".join(reversed(input().upper())))','','exec',optimize=1)
#encode object
stage2=base64.b85encode(zlib.compress(marshal.dumps(stage1),9))
#loader
stage3="import marshal,zlib;exec(marshal.loads(zlib.decompress(base64.b85decode("+str(stage2)+"))))"
#encode loader
stage4="import base64;exec(base64.b85decode("+str(base64.b85encode(bytes(stage3,'ascii')))+"))"
print(stage4)
'''