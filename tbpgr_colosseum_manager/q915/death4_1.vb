module Z
	sub Main()
		FOR J AS INTEGER=1 TO 8
			for I as integer=0 to 40\J
				Console.Write(chr(36+I*J*2))
			next
		NEXT
	end sub
end module