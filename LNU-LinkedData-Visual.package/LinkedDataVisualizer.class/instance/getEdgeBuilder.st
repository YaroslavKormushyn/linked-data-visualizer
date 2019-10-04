as yet unclassified
getEdgeBuilder
	| edgeBuilder |
	edgeBuilder := RTEdgeBuilder new.
	edgeBuilder view: composer view.
	edgeBuilder shapeBuilder: (shapes at: #edgeBuilder).
	^ edgeBuilder