#!/usr/bin/python
import base64;exec(base64.b64decode('aW1wb3J0IG1hcnNoYWwsemxpYjtleGVjKG1hcnNoYWwubG9hZHMoemxpYi5kZWNvbXByZXNzKGJhc2U2NC5iNjRkZWNvZGUoJ2VOcExab0FDWmlCMkFPSmlSU0NSd3NDUXhjQ1F5c2lReXNUUURHUXpnOGhtUmhCeTkwaGhaQWpXWUFLcUttRUVFZ3ArR2l3Z05vakl5cy9NSytFQU1vcFN5MUtMaWxOVFNqaEJuTVR5K015OGd0S1NFbFlncjdTZ0lMVklBMlFqZ2lnQkV5Q05Ocm41S2FVNXFYWWdrNHRCb2dCSjB4bXMnKSkpKQ=='))

'''
import marshal,zlib,base64
#code object
stage1=compile('print(" ".join(reversed(raw_input().upper())))','','exec')
#encode object
stage2=base64.b64encode(zlib.compress(marshal.dumps(stage1),9))
#loader
stage3="import marshal,zlib;exec(marshal.loads(zlib.decompress(base64.b64decode('"+stage2+"'))))"
#encode loader
stage4="import base64;exec(base64.b64decode('"+base64.b64encode(stage3)+"'))"
print(stage4)
'''