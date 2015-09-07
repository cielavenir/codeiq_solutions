module Z
	sub Main()
		for i as integer=0 to 207
			Console.Write(chr(97+i mod 26-((8-i mod 8)\8)*32))
		next
	end sub
end module