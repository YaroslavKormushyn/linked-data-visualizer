accessing
at: rowIndex at: columnIndex
	| marker |
	( self validAt: rowIndex at: columnIndex )
		ifFalse: [ SubscriptOutOfBounds signal: 'Invalid index.' ].
	self isEmpty 
		ifTrue: [ ^ 0 ].
	
	marker := first .
	[(marker rightNeighbour isNotNil) 
	and: [(marker rightNeighbour row < rowIndex) 
		or: [ marker rightNeighbour row = rowIndex 
			and: [ marker rightNeighbour column < columnIndex  ] ] ] ]
						whileTrue: [ marker := marker rightNeighbour ].
	
	marker rightNeighbour isNil 
		ifFalse: [ marker rightNeighbour row = rowIndex
			ifTrue: [ marker rightNeighbour column = columnIndex 
				ifTrue: [ ^ marker rightNeighbour value ] ] ].
	(marker row = rowIndex and: [ marker column = columnIndex ])
		ifTrue: [ ^ marker value ].
 	^ 0