as yet unclassified
getDefaultEdgeShapeBuilder
| shapeBuilder arrowHead arrowTail|
shapeBuilder := RTShapeBuilder new.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	arrowTail := RTSimpleArrow asTail
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		orthoHorizontalLine;
		horizontalAttachPoint;
		head: arrowHead;
		tail: arrowTail;
		color: Color black.
	
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	arrowTail := RTSimpleArrow asTail
		size: 1;
		baseSize: 3.
	shapeBuilder styledLine
		orthoVerticalLine;
		verticalAttachPoint;
		head: arrowHead;
		tail: arrowTail;
		color: Color black.
		^ shapeBuilder 