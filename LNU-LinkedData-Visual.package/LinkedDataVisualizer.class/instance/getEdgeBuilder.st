generate - shapes
getEdgeBuilder
	| edgeBuilder |
	edgeBuilder := RTEdgeBuilder new.
	edgeBuilder view: view.
	edgeBuilder shapeBuilder: (shapes at: #edgeBuilder).
	^ edgeBuilder