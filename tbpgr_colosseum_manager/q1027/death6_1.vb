module Z
	sub Main()
		Console.Write(2)
		for i as integer=3 to 999
			dim j as integer=2
			while i mod j
				j+=1
			end while
			if j=i then
				Console.Write(":{0}",i)
			end if
		next
	end sub
end module