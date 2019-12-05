private
drawEdgesWith: elements
	| edgeBuilder |
	edgeBuilder := self getEdgeBuilder.
	edgeBuilder elements: elements.
	edgeBuilder
		connectToAll: [ :el | 
			linkMessages
				collect: [ :msg | el perform: msg asSymbol ]
				thenReject: [ :res | res isNil or: [ res row ~= el row ] ] ].
	edgeBuilder shapeBuilder: (shapes at: #wrappingDownEdgeBuilder).
	edgeBuilder
		connectToAll: [ :el | 
			linkMessages
				collect: [ :msg | el perform: msg asSymbol ]
				thenReject: [ :res | res isNil or: [ res row = el row or: [ res row < el row ] ] ] ].
	edgeBuilder shapeBuilder: (shapes at: #wrappingUpEdgeBuilder).
	edgeBuilder
		connectToAll: [ :el | 
			linkMessages
				collect: [ :msg | el perform: msg asSymbol ]
				thenReject: [ :res | res isNil or: [ res row = el row or: [ res row > el row ] ] ] ]