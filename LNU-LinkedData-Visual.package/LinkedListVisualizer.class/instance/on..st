accessing
on: linkedStructure
	| elements |
	linkedStructure isEmpty
		ifTrue: [ ^ self ].
	elements := RTGroup new
		addAll:
			(linkedStructure
				linksCollect: [ :elLink | 
					elLink value column = 0
						ifTrue: [ (shapes at: #header) elementOn: elLink ]
						ifFalse: [ (shapes at: #data) elementOn: elLink ] ]);
		yourself.
	elements @ RTDraggable @RTPopup.
	view addAll: elements.
	RTGridLayout on: elements.
	self drawEdgesWith: elements.
	self setPositionsFor: elements.
	^ self