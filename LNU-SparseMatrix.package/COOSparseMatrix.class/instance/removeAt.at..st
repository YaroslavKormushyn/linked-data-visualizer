removal
removeAt: rowIndex at: columnIndex
	| marker |
	(self validAt: rowIndex at: columnIndex)
		ifFalse: [SubscriptOutOfBounds signal: 'Invalid index'].
	self isEmpty
		ifTrue: [ ^ self ].
	
	( first row = rowIndex ) & ( first column = columnIndex )
		ifTrue: [ first rightNeighbour isNotNil
					ifTrue: [ first rightNeighbour leftNeighbour: nil. 
							first := first rightNeighbour]
					ifFalse: [ first := nil.
							last := nil ] ].
	
	( last row = rowIndex ) & ( last column = columnIndex )
		ifTrue: [ last leftNeighbour isNotNil
					ifTrue: [ last leftNeighbour rightNeighbour: nil. 
							last := last leftNeighbour ]
					ifFalse: [ last := nil.
							first := nil ] ].
	
	marker := first .
	[(marker rightNeighbour isNotNil) and: [(marker rightNeighbour row < rowIndex)]]
						whileTrue: [ marker := marker rightNeighbour ].
	
	(marker rightNeighbour isNotNil and: [marker rightNeighbour row = rowIndex])
		ifTrue: [
			[(marker rightNeighbour isNotNil) and: [ (marker rightNeighbour row = rowIndex) and: [(marker rightNeighbour column < columnIndex)]]]
						whileTrue: [ marker := marker rightNeighbour ]]
		ifFalse: [ ^ self ].
	(marker rightNeighbour isNotNil and: [marker rightNeighbour row = rowIndex and: [(marker rightNeighbour column < columnIndex)]])
	ifTrue: [
		marker leftNeighbour rightNeighbour: marker rightNeighbour.
		marker rightNeighbour leftNeighbour: marker leftNeighbour].
	^ self