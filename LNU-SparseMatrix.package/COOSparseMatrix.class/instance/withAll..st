private
withAll: aCollection
	| list |
	list := ((1 to: aCollection size)
		collect: [ :rowIndex | 
			(1 to: (aCollection at: rowIndex) size)
				collect: [ :colIndex | 
					COOSparseMatrixNode
						row: rowIndex
						column: colIndex
						value: ((aCollection at: rowIndex) at: colIndex) ]
				thenReject: [ :node | node value = 0 or: [ node value isNil ] ] ]) asOrderedCollection.
	list := list inject: OrderedCollection new into: [ :array :each | array , each ].
	(list at: 1) rightNeighbour: (list at: 2).
	list at: list size put: ((list at: list size) leftNeighbour: (list at: list size - 1)).
	(2 to: list size - 1)
		do:
			[ :index | (list at: index) rightNeighbour: (list at: index + 1) leftNeighbour: (list at: index - 1) ].
	first := list at: 1.
	last := list at: list size