instance creation
on: aCOOSparseMatrix
	| comp nodes elements |
	comp := self getElementShape.
	nodes := aCOOSparseMatrix elementsAsCollection.
	nodes isEmpty ifTrue: [ ^ RTView new ].
	elements := comp elementsOn: nodes.
	elements @ RTDraggable.
	elements @ RTPopup.
	view addAll: elements.
	RTGridLayout on: elements.
	self drawEdgesWith: elements.
	self setPositionsFor: elements