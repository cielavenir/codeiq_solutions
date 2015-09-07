module Z
	sub Main()
		for i as integer=0 to 24
			System.Console.WriteLine("".PadLeft(i,"A"c)+chr(66+i)+"".PadLeft(24-i,"A"c))
		next
	end sub
end module