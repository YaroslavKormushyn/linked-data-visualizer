memory usage
sizeInMemory
	| size marker count |
	size := rows
		inject: 0
		into: [ :sum :rowHead | 
			marker := rowHead rightNeighbour.
			count := 0.
			[ marker column ~= 0 ] whileTrue: [ count := count + 1. marker := marker rightNeighbour ].
			sum + (marker rightNeighbour sizeInMemory * count) ].
	^ super sizeInMemory + size