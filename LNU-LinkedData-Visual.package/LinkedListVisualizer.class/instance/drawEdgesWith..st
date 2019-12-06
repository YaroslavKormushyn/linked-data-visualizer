private
drawEdgesWith: elements
	| edgeBuilder |
	edgeBuilder := self getEdgeBuilder.
	edgeBuilder elements: elements.
	edgeBuilder
		connectToAll: [ :el | 
			linkMessages
				collect: [ :msg | el perform: msg asSymbol ]
				thenReject: [ :res | res isNil ] ]