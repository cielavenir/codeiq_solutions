module Z
	sub Main()
		for i as integer=1 to 50
			Console.Write(iif(i mod 15,iif(i mod 5,iif(i mod 3,i,"fizz"),"buzz"),"FIZZBUZZ"))
		next
	end sub
end module