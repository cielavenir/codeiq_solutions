#!/usr/bin/awk -f
BEGIN{FS=","};$0=$1+$2-1
