initialization
setPositions
	| gap |
	gap := 10.
	view elements
		do: [ :e | 
			[ :continue | 
			| aNode |
			e model isNil
				ifTrue: [ continue value ].
			aNode := e model.
			e translateTo: (elementSize + gap) * (aNode column @ aNode row) ] valueWithExit. ]