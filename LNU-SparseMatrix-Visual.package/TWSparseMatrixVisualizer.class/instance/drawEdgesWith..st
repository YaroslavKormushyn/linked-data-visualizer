private
drawEdgesWith: elements
	| edgeBuilder arrowHead offset |
	edgeBuilder := RTEdgeBuilder new.
	edgeBuilder view: view.
	edgeBuilder elements: elements.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	"Draw edges for row elements excluding headers"
	edgeBuilder shape styledLine
		orthoHorizontalLine;
		horizontalAttachPoint;
		head: arrowHead;
		color: Color black.
	edgeBuilder
		connectTo: [ :el | 
			(el rightNeighbour isNotNil and: [ el rightNeighbour column > el column ])
				ifTrue: [ el rightNeighbour ] ].
	"Draw row edges for row headers"
	offset := 4.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	edgeBuilder shape styledLine
		orthoHorizontalLineBottommostWithOffset: offset;
		horizontalRightAttachPoint;
		head: arrowHead;
		color: Color red.
	edgeBuilder
		connectTo: [ :el | 
			(el belowNeighbour isNotNil and: [ el belowNeighbour row <= el row ])
				ifTrue: [ el belowNeighbour ] ].
	"Draw edges for columns excluding headers"
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	edgeBuilder shape styledLine
		orthoVerticalLine;
		verticalAttachPoint;
		head: arrowHead;
		color: Color black.
	edgeBuilder
		connectTo: [ :el | 
			(el belowNeighbour isNotNil and: [ el belowNeighbour row > el row ])
				ifTrue: [ el belowNeighbour ] ].
	"Draw edges for column headers"
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	edgeBuilder shape styledLine
		orthoVerticalLineRightmostWithOffset: offset;
		verticalBottomAttachPoint;
		head: arrowHead;
		color: Color red.
	edgeBuilder
		connectTo: [ :el | 
			(el rightNeighbour isNotNil and: [ el rightNeighbour column <= el column ])
				ifTrue: [ el rightNeighbour ] ]