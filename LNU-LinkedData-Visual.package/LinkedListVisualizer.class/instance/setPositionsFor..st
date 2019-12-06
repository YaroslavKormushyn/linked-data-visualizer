initialization
setPositionsFor: elements
	elements
		reject: [ :e | e model isNil or: [ e model value isNil ] ]
		thenDo: [ :e | 
			| aNode |
			aNode := e model value.
			e translateTo: ((elementSize + gap) * aNode column) @ 0 ]