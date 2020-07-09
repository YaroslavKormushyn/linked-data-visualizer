transformation
transpose
	| result tempList marker |
	result := self class rows: columnNumber columns: rowNumber.
	self isEmpty
		ifFalse: [ marker := first.
			tempList := SortedCollection new
				sortBlock: [ :left :right | 
					left row < right row
						or: [ left row = right row and: [ left column < right column ] ] ].
			[ marker isNotNil ]
				whileTrue: [ tempList add: (COOSparseMatrixNode row: marker column column: marker row value: marker value).
					marker := marker rightNeighbour ].
			tempList reSort.
			tempList
				keysAndValuesDo: [ :index :element | 
					index - 1 > 0
						ifTrue: [ element leftNeighbour: (tempList at: index - 1) ].
					index < tempList size
						ifTrue: [ element rightNeighbour: (tempList at: index + 1) ] ].
			result first: tempList first.
			result last: tempList last ].
	^ result