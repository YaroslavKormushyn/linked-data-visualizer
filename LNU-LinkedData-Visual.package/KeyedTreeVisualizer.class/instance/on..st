accessing
on: linkedStructure
	| nodes elements |
	nodes := self getElementsFor: linkedStructure.
	nodes isNil | nodes isEmpty
		ifTrue: [ ^ self ].
	elements := (shapes at: #data) elementsOn: nodes.
	elements
		when: TRMouseClick
		do: [ :evt | 
			| cls |
			cls := evt element model.
			(view attributeAt: #GlamourContext) presentation
				selection: cls source ].
	elements @ RTDraggable @ RTPopup.
	view addAll: elements.
	RTGridLayout on: elements.
	self drawEdgesWith: elements.
	self setPositionsFor: elements.
	^ self