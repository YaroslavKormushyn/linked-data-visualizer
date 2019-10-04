generate - shapes
getDefaultEdgeShapeBuilder
	| shapeBuilder arrowHead arrowTail |
	shapeBuilder := RTShapeBuilder new.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	arrowTail := RTSimpleArrow asTail
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		shortestDistanceAttachPoint;
		head: arrowHead;
		tail: arrowTail;
		color: Color black.
	^ shapeBuilder