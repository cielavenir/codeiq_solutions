#!/usr/bin/python
import json;print(','.join(str(abs((x//19+abs(x//19*19-x)//10)*19-x))for x in json.loads(raw_input())))