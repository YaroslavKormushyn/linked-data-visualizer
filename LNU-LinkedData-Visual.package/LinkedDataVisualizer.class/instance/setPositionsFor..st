initialization
setPositionsFor: elements
	elements
	reject: [ :e | e model isNil ] thenDo:[ :e | 
			| aNode |
			aNode := e model.
			e translateTo: (elementSize + gap) * (aNode column @ aNode row) ]