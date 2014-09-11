#!/usr/bin/ruby
#coding:utf-8
def compile_codepoints(a)
	defined={0=>1,1=>1,2=>1,4=>1,256=>1}
	a.each{|e|
		n=e
		while n>0
			if n%2>0
				if !defined[n]
					puts "(lazy-def #{n} '(1+ #{n-1}))"
					defined[n]=1
				end
				n-=1
			end
			if !defined[n]
				puts "(lazy-def #{n} '(* 2 #{n/2}))"
				defined[n]=1
			end
			n/=2
		end
	}
end

STR=STDIN.tty? ? "CodeIQ ２周年！\n" : STDIN.read

puts <<EOM
(load "../lazier.scm")
(load "../prelude.scm")
EOM

compile_codepoints(STR.bytes.to_a)

puts <<EOM
(lazy-def '(ans in)
EOM

print "'"
STR.each_byte{|e|print "(cons #{e} "}
print 'end-of-output'
STR.each_byte{|e|print ")"}
puts

puts <<EOM
)

(print-as-unlambda (laze 'ans))
EOM