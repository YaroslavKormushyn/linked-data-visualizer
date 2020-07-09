private
elementsAsCollection
	| result |
	self isEmpty
		ifTrue: [ ^ rows
				collectWithIndex: [ :head :rowIndex | MatrixElement row: rowIndex column: 0 value: nil ] ]
		ifFalse: [ ^ (rows
				collectWithIndex: [ :head :rowIndex | 
					result := OrderedCollection
						with: (MatrixElement row: rowIndex column: 0 value: nil).
					result
						addAll:
							(head asOrderedCollection
								collectWithIndex:
									[ :el :ind | MatrixElement row: rowIndex column: el column value: el value source: el ]).
					result
						withIndexDo: [ :el :ind | 
							ind % result size = 0
								ifFalse: [ el next: (result at: ind + 1) ] ].
					result ]) flattened ]