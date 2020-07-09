memory usage
sizeInMemory 
	| size marker |
	size := 0.
	self isEmpty ifFalse: [ 
		marker := first.
		[ marker rightNeighbour isNotNil ] 
			whileTrue: [ 
				size := size + marker sizeInMemory. 
				marker := marker rightNeighbour ].
	].
	^ super sizeInMemory + size