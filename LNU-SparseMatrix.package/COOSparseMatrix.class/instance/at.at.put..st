accessing
at: rowIndex at: columnIndex put: aValue
	| leftNeighbour rightNeighbour newNode |
	(self validAt: rowIndex at: columnIndex)
		ifFalse: [ SubscriptOutOfBounds signal: 'Invalid index.' ].
	aValue = 0
		ifTrue: [ ^ self removeAt: rowIndex at: columnIndex ].
	newNode := COOSparseMatrixNode row: rowIndex column: columnIndex value: aValue.
	self isEmpty
		ifTrue: [ first := newNode.
			last := newNode.
			^ self ].
	(newNode row < first row or: [ newNode row = first row and: [ newNode column < first column ] ])
		ifTrue: [ first leftNeighbour: newNode.
			newNode rightNeighbour: first.
			first := newNode.
			^ self ].
	(newNode row > last row or: [ newNode row = last row and: [ newNode column > last column ] ])
		ifTrue: [ last rightNeighbour: newNode.
			newNode leftNeighbour: last.
			last := newNode.
			^ self ].
	leftNeighbour := first.
	leftNeighbour row = rowIndex & (leftNeighbour column = columnIndex)
		ifTrue: [ leftNeighbour value: aValue.
			^ self ].
	[ leftNeighbour rightNeighbour isNotNil
		and: [ leftNeighbour rightNeighbour row < rowIndex or: [ leftNeighbour rightNeighbour row = rowIndex and: [ leftNeighbour rightNeighbour column < columnIndex ] ] ] ]
		whileTrue: [ leftNeighbour := leftNeighbour rightNeighbour ].
	(leftNeighbour rightNeighbour row = rowIndex and: [ leftNeighbour rightNeighbour column = columnIndex ])
		ifTrue: [ leftNeighbour rightNeighbour value: aValue.
			^ self ].
	rightNeighbour := leftNeighbour rightNeighbour.
	newNode rightNeighbour: rightNeighbour leftNeighbour: leftNeighbour.
	rightNeighbour leftNeighbour: newNode.
	leftNeighbour rightNeighbour: newNode