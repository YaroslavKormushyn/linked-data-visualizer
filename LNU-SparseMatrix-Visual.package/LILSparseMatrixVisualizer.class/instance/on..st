instance creation
on: aLILSparseMatrix
	| elementShape headerShape elements |
	elementShape := self getElementShape.
	headerShape := self getHeaderShape.
	elements := RTGroup new
		addAll:
			(aLILSparseMatrix elementsAsCollection
				collect: [ :el | 
					(el row = 0 or: [ el column = 0 ])
						ifTrue: [ headerShape elementOn: el ]
						ifFalse: [ elementShape elementOn: el ] ]);
		yourself.
	elements @ RTDraggable.
	elements @ RTPopup.
	view addAll: elements.
	self drawEdgesWith: elements.
	RTGridLayout on: elements.
	self setPositionsFor: elements