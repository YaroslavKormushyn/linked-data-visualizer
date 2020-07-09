arithmetic
+ aCOOMatrix
	| leftMatrixMarker rightMatrixMarker result newNode continue |
	(self  isKindOf: aCOOMatrix class)
		ifFalse: [ Error signal: 'Convert matrix' ].
	(rowNumber = aCOOMatrix rowNumber
		and: [ columnNumber = aCOOMatrix columnNumber ])
		ifFalse: [ Error signal: 'Matrices must be of same size' ].
	leftMatrixMarker := first.
	rightMatrixMarker := aCOOMatrix first.
	result := self class rows: rowNumber columns: columnNumber.
	(leftMatrixMarker preceeds: rightMatrixMarker)
		ifTrue: [ result first: leftMatrixMarker copy.
			result last: result first.
			leftMatrixMarker := leftMatrixMarker rightNeighbour ]
		ifFalse: [ (leftMatrixMarker follows: rightMatrixMarker)
				ifTrue: [ result first: rightMatrixMarker copy.
					result last: result first.
					rightMatrixMarker := rightMatrixMarker rightNeighbour ]
				ifFalse: [ rightMatrixMarker value + leftMatrixMarker value = 0
						ifTrue: [ result first: (COOSparseMatrixNode row: 0 column: 0 value: 0).
							result last: result first ]
						ifFalse: [ result
								first:
									(rightMatrixMarker copy
										value: rightMatrixMarker value + leftMatrixMarker value).
							result last: result first ].
					rightMatrixMarker := rightMatrixMarker rightNeighbour.
					leftMatrixMarker := leftMatrixMarker rightNeighbour ] ].
	[ leftMatrixMarker isNotNil and: [ rightMatrixMarker isNotNil ] ]
		whileTrue: [ (leftMatrixMarker preceeds: rightMatrixMarker)
				ifTrue: [ newNode := leftMatrixMarker copy.
					leftMatrixMarker := leftMatrixMarker rightNeighbour ]
				ifFalse: [ (leftMatrixMarker follows: rightMatrixMarker)
						ifTrue: [ newNode := rightMatrixMarker copy.
							rightMatrixMarker := rightMatrixMarker rightNeighbour ]
						ifFalse: [ (leftMatrixMarker row = rightMatrixMarker row
								and: [ leftMatrixMarker column = rightMatrixMarker column ])
								ifTrue: [ leftMatrixMarker value + rightMatrixMarker value = 0
										ifTrue: [ continue := true ]
										ifFalse: [ newNode := rightMatrixMarker copy
												value: rightMatrixMarker value + leftMatrixMarker value ].
									rightMatrixMarker := rightMatrixMarker rightNeighbour.
									leftMatrixMarker := leftMatrixMarker rightNeighbour ] ] ].
			newNode isNil
				ifFalse: [ result last rightNeighbour: newNode.
					newNode leftNeighbour: result last.
					result last: newNode.
					newNode := nil ] ].
	[ leftMatrixMarker isNotNil ]
		whileTrue: [ newNode := leftMatrixMarker copy.
			leftMatrixMarker := leftMatrixMarker rightNeighbour.
			result last rightNeighbour: newNode.
			newNode leftNeighbour: result last.
			result last: newNode ].
	[ rightMatrixMarker isNotNil ]
		whileTrue: [ newNode := rightMatrixMarker copy.
			rightMatrixMarker := rightMatrixMarker rightNeighbour.
			result last rightNeighbour: newNode.
			newNode leftNeighbour: result last.
			result last: newNode ].

	"remove the dummy result first if zero"
	result first value = 0
		ifTrue: [ result first: result first rightNeighbour.
			result first leftNeighbour: nil ].
	^ result