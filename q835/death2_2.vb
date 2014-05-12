module Z
	sub Main()
		for i as integer=0 to 25
			for j as integer=0 to 7
				Console.Write(chrw(ascw("aAあアアあAa"(j))+i))
			next
		next
	end sub
end module