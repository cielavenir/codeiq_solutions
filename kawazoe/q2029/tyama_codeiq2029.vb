module StepUpSum
	sub Main(ByVal args() as String)
		while true
			dim s as string=Console.ReadLine()
			if s=nothing
				exit while
			end if
			dim n as long=s
			if n=0
				exit while
			end if
			dim r as long=0
			dim i as integer=2
			while true
				dim x as long=n-ctype(i,long)*(i-1)\2
				if x<i
					exit while
				end if
				if x mod i=0
					r+=x\i
				end if
				i+=1
			end while
			Console.WriteLine(r)
		end while
	end sub
end module