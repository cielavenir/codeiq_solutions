module Z
	sub Main()
		dim x as integer()={97,65,12354,12450,12450,12354,65,97}
		for i as integer=0 to 25
			for j as integer=0 to 7
				Console.Write(chrw(x(j)+i))
			next
		next
	end sub
end module