private
drawEdgesWith: elements
	|edgeBuilder|
	edgeBuilder := shapes at: #edgeBuilder.
	edgeBuilder elements: elements.
	edgeBuilder
		connectTo: [ :el | 
			linkMessages collect: [ :msg | el perform: msg asSymbol ]
			thenReject: [ :res | res isNil ]
			 ].