private
rowAsCollectionAt: rowIndex
	| result |
	self isEmpty
		ifTrue: [ ^ OrderedCollection new ]
		ifFalse: [ 
					result := OrderedCollection
						with: (MatrixElement row: rowIndex column: 0 value: nil).
					result
						addAll:
							((rows at: rowIndex)
								collectWithIndex:
									[ :el :ind | MatrixElement row: rowIndex column: el column value: el value ]).
					result
						withIndexDo: [ :el :ind | 
							ind % result size = 0
								ifFalse: [ el next: (result at: ind + 1) ] ].
					^ result ]