#!/bin/bash
set -eu
while true; do
	read n || break
	if [ $n -eq 0 ]; then break; fi
	r=0
	i=1
	while true; do
		n=$((n-i))
		i=$((i+1))
		if [ $n -lt $i ]; then break; fi
		if [ $((n%i)) -eq 0 ]; then
			r=$((r+(n/i)))
		fi
	done
	echo $r
done