initialization
initialize
	| shapeBuilder arrowHead arrowTail |
	super initialize.
	shapeBuilder := RTShapeBuilder new.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		orthoVerticalLine;
		verticalBottomToTopAttachPoint;
		head: arrowHead;
		color: Color black.
	shapes at: #wrappingDownEdgeBuilder put: shapeBuilder.
	shapeBuilder := RTShapeBuilder new.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		orthoVerticalLine;
		verticalTopToBottomAttachPoint ;
		head: arrowHead;
		color: Color black.
	shapes at: #wrappingUpEdgeBuilder put: shapeBuilder