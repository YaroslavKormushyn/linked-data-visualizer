initialization
initialize
	| shapeBuilder arrowHead |
	super initialize.
	gap := 10.
	edgeOffset := 4.
	linkMessages := #(#rightNeighbour #belowNeighbour) asSet.
	shapeBuilder := RTShapeBuilder new.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		orthoHorizontalLineBottommostWithOffset: edgeOffset;
		horizontalRightAttachPoint;
		head: arrowHead;
		color: Color red.
	shapes at: #columnLoopEdgeBuilder put: shapeBuilder.
	shapeBuilder := RTShapeBuilder new.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		orthoVerticalLineRightmostWithOffset: edgeOffset;
		verticalBottomAttachPoint;
		head: arrowHead;
		color: Color red.
	shapes at: #rowLoopEdgeBuilder put: shapeBuilder