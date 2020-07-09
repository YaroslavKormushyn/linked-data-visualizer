*LNU-SparseMatrix-Visual
byMatrix: aCOOSparseMatrix
	| result currentLeftRow currentRightColumn priorityColumn leftMatrixMarker leftSavedMatrixMarker rightMatrixMarker transposed newNode sum |
	columnNumber = aCOOSparseMatrix rowNumber
		ifFalse: [ Error signal: 'Invalid matrix size' ].
	(aCOOSparseMatrix isEmpty or: [ self isEmpty ])
		ifTrue:
			[ ^ self class rows: rowNumber columns: aCOOSparseMatrix columnNumber ].
	
	transposed := aCOOSparseMatrix transpose.
	leftSavedMatrixMarker := leftMatrixMarker := first.
	rightMatrixMarker := transposed first.
	currentLeftRow := leftMatrixMarker row.
	currentRightColumn := rightMatrixMarker row.
	result := self class
		rows: rowNumber
		columns: aCOOSparseMatrix columnNumber.
	result
		first:
			((COOSparseMatrixNode new row: 0 column: 0 value: 0)
				rightNeighbour: nil).
	result last: result first.
	sum := 0.
	self
		withEscaper: [ :end | 
			[ leftMatrixMarker isNotNil or: [ rightMatrixMarker isNotNil ] ]
				whileTrue: [ self
						withEscaper: [ :outer | 
							"Switch to next row in left and reset right marker if right ended"
							rightMatrixMarker isNil
								ifTrue: [ leftSavedMatrixMarker := leftMatrixMarker.
									rightMatrixMarker := transposed first ].
							"reset left marker to row beginning"
							leftMatrixMarker := leftSavedMatrixMarker.
							currentLeftRow := leftMatrixMarker row.
							currentRightColumn := rightMatrixMarker row.
							self
								withEscaper: [ :next | 
									[ leftMatrixMarker isNotNil
										and: [ rightMatrixMarker isNotNil
												and: [ leftMatrixMarker row = currentLeftRow
														and: [ rightMatrixMarker row = currentRightColumn ] ] ] ]
										whileTrue: [ priorityColumn := {leftMatrixMarker column.
											rightMatrixMarker column} max.
											"Find same column as prioritized or higher in left"
											[ leftMatrixMarker isNotNil
												and: [ leftMatrixMarker row = currentLeftRow
														and: [ leftMatrixMarker column < priorityColumn ] ] ]
												whileTrue: [ leftMatrixMarker := leftMatrixMarker rightNeighbour ].
											leftMatrixMarker isNil
												ifTrue: [ [ rightMatrixMarker isNotNil
														and: [ rightMatrixMarker row = currentRightColumn ] ]
														whileTrue: [ rightMatrixMarker := rightMatrixMarker rightNeighbour ].

													"If no intersection - end"
													rightMatrixMarker isNil
														ifTrue: [ end value ].
													"Else - continue loop"
													next value ].
											leftMatrixMarker row ~= currentLeftRow
												ifTrue: [ [ rightMatrixMarker isNotNil
														and: [ rightMatrixMarker row = currentRightColumn ] ]
														whileTrue: [ rightMatrixMarker := rightMatrixMarker rightNeighbour ].
													next value ].
											priorityColumn := leftMatrixMarker column.

											"Find same column as prioritized or higher in right"
											[ rightMatrixMarker isNotNil
												and: [ rightMatrixMarker row = currentRightColumn
														and: [ rightMatrixMarker column < priorityColumn ] ] ]
												whileTrue: [ rightMatrixMarker := rightMatrixMarker rightNeighbour ].
											rightMatrixMarker isNil
												ifTrue: [ [ leftMatrixMarker isNotNil
														and: [ leftMatrixMarker row = currentLeftRow ] ]
														whileTrue: [ leftMatrixMarker := leftMatrixMarker rightNeighbour ].

													"If no intersections - end"
													leftMatrixMarker isNil
														ifTrue: [ end value ].
													"Else - continue loop"
													next value ].
											rightMatrixMarker row ~= currentRightColumn
												ifTrue: [ next value ].
											leftMatrixMarker column = rightMatrixMarker column
												ifTrue: [ sum := sum + (leftMatrixMarker value * rightMatrixMarker value).
													leftMatrixMarker := leftMatrixMarker rightNeighbour.
													rightMatrixMarker := rightMatrixMarker rightNeighbour ]
												ifFalse: [ priorityColumn := rightMatrixMarker column ] ] ].
							sum = 0
								ifFalse: [ newNode := COOSparseMatrixNode
										row: currentLeftRow
										column: currentRightColumn
										value: sum.
									result last rightNeighbour: newNode.
									newNode leftNeighbour: result last.
									result last: newNode.
									sum := 0 ] ].
					sum = 0
						ifFalse: [ newNode := COOSparseMatrixNode
								row: currentLeftRow
								column: currentRightColumn
								value: sum.
							result last rightNeighbour: newNode.
							newNode leftNeighbour: result last.
							result last: newNode.
							sum := 0 ] ] ].
	"nil the reference to dummy head"
	result first rightNeighbour leftNeighbour: nil.
	result first: result first rightNeighbour.
	^ result