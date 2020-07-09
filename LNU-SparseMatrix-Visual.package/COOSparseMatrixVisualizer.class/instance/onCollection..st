instance creation
onCollection: aCollection
	| comp elements |
	comp := self getElementShape.
	aCollection isEmpty
		ifTrue: [ ^ RTView new ].
	elements := comp elementsOn: aCollection.
	elements @ RTDraggable.
	elements @ RTPopup.
	view addAll: elements.
	RTGridLayout on: elements.
	self drawEdgesWith: elements.
	self setPositionsFor: elements