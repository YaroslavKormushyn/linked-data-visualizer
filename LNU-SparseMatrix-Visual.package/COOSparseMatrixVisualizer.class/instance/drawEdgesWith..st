private
drawEdgesWith: elements
	| edgeBuilder arrowHead arrowTail |
	edgeBuilder := RTEdgeBuilder new.
	edgeBuilder view: view.
	edgeBuilder elements: elements.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
		arrowTail := RTSimpleArrow asTail
		size: 1;
		baseSize: 3.
	edgeBuilder shape styledLine
		orthoHorizontalLine;
		horizontalAttachPoint;
		head: arrowHead;
		tail: arrowTail;
		color: Color black.
	edgeBuilder
		connectTo: [ :el | 
			(el rightNeighbour isNotNil and: [ el rightNeighbour row = el row ])
				ifTrue: [ el rightNeighbour ] ].
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
		arrowTail := RTSimpleArrow asTail
		size: 1;
		baseSize: 3.
	edgeBuilder shape styledLine
		orthoVerticalLine;
		verticalAttachPoint;
		head: arrowHead;
		tail: arrowTail;
		color: Color black.
	edgeBuilder
		connectTo: [ :el | 
			(el rightNeighbour isNotNil and: [ el rightNeighbour row > el row ])
				ifTrue: [ el rightNeighbour ] ]