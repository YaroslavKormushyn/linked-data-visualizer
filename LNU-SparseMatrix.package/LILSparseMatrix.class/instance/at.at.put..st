as yet unclassified
at: rowIndex at: columnIndex put: aValue
	|row index|
	(self validAt: rowIndex at: columnIndex)
		ifFalse: [ SubscriptOutOfBounds signal: 'Indices must be of valid range.' ].
	
	row := rows at: rowIndex.
	aValue = 0
	ifTrue: [ 
		row
			removeAllSuchThat: [ :link | link column = columnIndex]. 
			^ self].
	row isEmpty 
	ifTrue: [ row
			addFirst: (LILSparseMatrixNode 
						column: columnIndex 
						value: aValue) ]
	ifFalse: [ index := row findLast: [:link | link column <= columnIndex ].
			index = 0
				ifTrue: [ row
					addFirst: (LILSparseMatrixNode 
						column: columnIndex 
						value: aValue).
						 ^ self].
			index = columnIndex 
			ifTrue: [ (row at: index) value: aValue]
			ifFalse: [
				row
					add: (LILSparseMatrixNode 
						column: columnIndex 
						value: aValue) 
					afterLink:  (row linkAt: index)]].
	^ self