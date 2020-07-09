instance creation
on: aTWSparseMatrix
	| elementShape headerShape nodes elements |
	elementShape := self getElementShape.
	headerShape := self getHeaderShape.
	nodes := aTWSparseMatrix elementsAsCollection
		collect: [ :el | 
			(el row = 0 or: [ el column = 0 ])
				ifTrue: [ headerShape elementOn: el ]
				ifFalse: [ elementShape elementOn: el ] ].
	elements := RTGroup new
		addAll: nodes;
		yourself.
	elements @ RTDraggable.
	elements @ RTPopup.
	view addAll: elements.
	self drawEdgesWith: elements.
	RTGridLayout on: elements.
	self setPositionsFor: elements