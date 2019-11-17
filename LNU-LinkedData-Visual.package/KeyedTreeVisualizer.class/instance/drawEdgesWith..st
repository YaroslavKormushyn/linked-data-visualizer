private
drawEdgesWith: elements
	| edgeBuilder |
	edgeBuilder := self getEdgeBuilder.
	edgeBuilder elements: elements.
	edgeBuilder
		moveBehind;
		highlightable;
		labelElement: [ :anEdge | anEdge to model key ]
			fontSize: elementSize / 10;
		connectToAll: [ :el | 
			(el source isKindOf: KeyedTree)
				ifTrue: [ | subset |
					subset := el source values.
					elements elements
						collect: [ :e | e model ]
						thenReject: [ :m | (subset includes: m source) not ] ]
				ifFalse: [ {} ] ]