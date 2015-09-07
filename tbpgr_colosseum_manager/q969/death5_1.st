1 to:50 do:[:i|
	i\\15==0 ifTrue:[
		Transcript show:'FIZZBUZZ'
	]ifFalse:[
		i\\3==0 ifTrue:[
			Transcript show:'fizz'
		]ifFalse:[
			i\\5==0 ifTrue:[
				Transcript show:'buzz'
			]ifFalse:[
				Transcript show:i printString
			]
		]
	]
]