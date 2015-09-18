//usr/bin/env fsharpi $0 $@;exit
#indent "off"

open System;;

let rec calc (r:int64) (i:int64) (n:int64) =
	let x = n-i*(i-1L)/2L in
	if x>=i then
		if x%i=0L then
			calc (r+x/i) (i+1L) n
		else
			calc r (i+1L) n
	else
		r;;

let mutable s=Console.ReadLine() in
	while s<>null do
		let n=int64(s) in
		Console.WriteLine(calc 0L 2L n);
		s<-Console.ReadLine()
	done;;