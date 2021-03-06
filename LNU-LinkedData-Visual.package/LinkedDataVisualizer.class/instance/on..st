accessing
on: linkedStructure
	| nodes elements |
	nodes := linkedStructure viewElements.
	nodes isNil | nodes isEmpty
		ifTrue: [ ^ self ].
	elements := (shapes at: #data) elementsOn: nodes.
	elements @ RTDraggable.
	view addAll: elements.
	RTGridLayout on: elements.
	self drawEdgesWith: elements.
	self setPositionsFor: elements.
	^ self