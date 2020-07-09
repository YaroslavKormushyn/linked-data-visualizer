copying
copy
	| copy head tail marker newNode |
	copy := COOSparseMatrix rows: rowNumber columns: columnNumber.
	
	marker := first.
	head := first copy.
	tail := head.
	marker := marker rightNeighbour.
	
	[ marker isNotNil ]
		whileTrue: 
		[ newNode := marker copy.
		  tail rightNeighbour: newNode.
		  newNode leftNeighbour: tail.
		  tail := newNode.
		  marker := marker rightNeighbour].
	
	copy first: head; last: tail.
	^ copy