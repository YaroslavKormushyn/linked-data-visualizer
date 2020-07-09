private
drawEdgesWith: elements connectTo: aBlock
	| edgeBuilder arrowHead |
	edgeBuilder := RTEdgeBuilder new.
	edgeBuilder view: view.
	edgeBuilder elements: elements.
	arrowHead := RTSimpleArrow asHead
		size: 1;
		baseSize: 3.
	edgeBuilder shape styledLine
		orthoHorizontalLine;
		horizontalAttachPoint;
		head: arrowHead;
		color: Color black.
	edgeBuilder
		connectTo: aBlock