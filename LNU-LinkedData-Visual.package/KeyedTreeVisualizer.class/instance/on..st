accessing
on: linkedStructure
	| nodes elements layout edges |
	nodes := self getElementsFor: linkedStructure.
	nodes
		addFirst:
			(KeyedTreeElement new
				source: linkedStructure;
				key: #root;
				yourself).
	nodes isNil | nodes isEmpty
		ifTrue: [ ^ self ].
	elements := self setElementsFor: nodes.
	elements
		when: TRMouseClick
		do: [ :evt | 
			| cls |
			cls := evt element model.
			(view attributeAt: #GlamourContext) presentation
				selection: cls source ].
	elements @ RTDraggable @ RTPopup.
	view addAll: elements.
	edges := self drawEdgesWith: elements.
	layout := RTTreeLayout new
		verticalGap: 20;
		horizontalGap: 20;
		yourself.
	layout on: elements.
	edges
		@
			(RTLabeled new
				fontSize: 10;
				color: Color gray;
				setAsShouldBeInTheFront;
				textElement: [ :anEdge | anEdge to model key ]).
	^ self