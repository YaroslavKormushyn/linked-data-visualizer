private
drawEdgesWith: elements
	| edgeBuilder |
	edgeBuilder := self getEdgeBuilder.
	edgeBuilder elements: elements.
	edgeBuilder
		connectToAll: [ :el | 
			linkMessages
				collect: [ :msg | el perform: msg asSymbol ]
				thenReject: [ :res | res isNil or: [ res row = 0 or: [res column = 0] ] ] ].
	edgeBuilder shapeBuilder: (shapes at: #rowLoopEdgeBuilder).
	edgeBuilder
		connectToAll: [ :el | 
			linkMessages
				collect: [ :msg | el perform: msg asSymbol ]
				thenReject: [ :res | res isNil or: [ res column ~= 0 ] ] ].
	edgeBuilder shapeBuilder: (shapes at: #columnLoopEdgeBuilder).
	edgeBuilder
		connectToAll: [ :el | 
			linkMessages
				collect: [ :msg | el perform: msg asSymbol ]
				thenReject: [ :res | res isNil or: [ res row ~= 0 ] ] ]