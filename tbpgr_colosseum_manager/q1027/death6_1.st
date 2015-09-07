2 to:999 do:[:i|
	|j|
	j:=2.
	[i\\j>0] whileTrue:[j:=j+1].
	j==i ifTrue:[
		i>2 ifTrue:[Transcript show:':'].
		Transcript show:i printString
	]
]