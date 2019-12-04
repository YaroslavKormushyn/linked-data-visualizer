accessing
on: linkedStructure
	| nodes elements |
	nodes := linkedStructure viewElements.
	nodes isNil | nodes isEmpty
		ifTrue: [ ^ self ].
	elements := RTGroup new
		addAll:
			(nodes
				collect: [ :node | 
					(node row = 0 or: [ node column = 0 ])
						ifTrue: [ (shapes at: #header) elementOn: node ]
						ifFalse: [ (shapes at: #data) elementOn: node ] ]);
		yourself.
	elements
		when: TRMouseClick
		do: [ :evt | 
			| cls |
			cls := evt element model.
			"Transcript
				show: 'select: ' , cls source asString;
				cr."
			(view attributeAt: #GlamourContext) presentation
				selection: cls source ].
	elements @ RTDraggable @ RTPopup.
	view addAll: elements.
	RTGridLayout on: elements.
	self drawEdgesWith: elements.
	self setPositionsFor: elements.
	^ self