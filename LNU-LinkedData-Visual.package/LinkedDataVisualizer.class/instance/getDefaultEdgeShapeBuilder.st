generate - shapes
getDefaultEdgeShapeBuilder
	| shapeBuilder arrowHead |
	shapeBuilder := RTShapeBuilder new.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		shortestDistanceAttachPoint;
		head: arrowHead;
		color: Color black.
	^ shapeBuilder