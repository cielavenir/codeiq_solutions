module CodeIQ983
	sub Main(ByVal args() as String)
		dim starting as long=5
		dim bse as long=10
		while true
			dim s as string=Console.ReadLine()
			if s=nothing
				exit while
			end if
			dim n as long=s
			n=n+starting-2
			dim digits as long=1
			dim expbase as long=1
			dim x as long=bse-1
			while x<=n
				n=n-x
				digits=digits+1
				expbase=expbase*bse
				x=digits*expbase*(bse-1)
			end while
			dim num as long=expbase+int(n/digits)
			dim d as long=digits-1l-(n mod digits)
			while d>0
				num=int(num/bse)
				d=d-1
			end while
			Console.WriteLine(num mod bse)
		end while
	end sub
end module