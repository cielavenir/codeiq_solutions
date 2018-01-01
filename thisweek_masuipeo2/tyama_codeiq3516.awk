#!/usr/bin/awk -f
#$0=$2*($1-$2)+$3*($1-$3)-$2*$3
$0=$1*($2+$3)-$2^2-$3^2-$2*$3
#acknowledgement: http://math.a.la9.jp/akaeru.htm

#awk '$0=$1*($2+$3)-$2^2-$3^2-$2*$3'
