module Z
	sub Main()
		for each x as char in "deathma colosseum"
			System.Console.Write(">"+"".PadLeft(int(x),"+"c)+".")
		next
	end sub
end module