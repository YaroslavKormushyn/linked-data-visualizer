*LNU-SparseMatrix-Visual
byMatrixAnimated: aCOOSparseMatrix withDelay: delay visualizer: viz
	| result transposed newNode sum operationProcess operationBlock visualizer currentLeftRow currentRightColumn leftMatrixMarker leftSavedMatrixMarker rightMatrixMarker |
	columnNumber = aCOOSparseMatrix rowNumber
		ifFalse: [ Error signal: 'Invalid matrix size' ].
	(aCOOSparseMatrix isEmpty or: [ self isEmpty ])
		ifTrue:
			[ ^ self class rows: rowNumber columns: aCOOSparseMatrix columnNumber ].
	result := self class
		rows: rowNumber
		columns: aCOOSparseMatrix columnNumber.
	result
		first:
			((COOSparseMatrixNode new row: 0 column: 0 value: 0)
				rightNeighbour: nil).
	result last: result first.
	transposed := aCOOSparseMatrix transpose.
	visualizer := viz.
	visualizer getComposedViewOf: self with: transposed result: result.
	operationBlock := [ | priorityColumn leftMarkerElement rightMarkerElement nowProcessingElementIndex |
	leftSavedMatrixMarker := leftMatrixMarker := first.
	rightMatrixMarker := transposed first.
	currentLeftRow := leftMatrixMarker row.
	currentRightColumn := rightMatrixMarker row.
	nowProcessingElementIndex := (RTLabel
		text:
			[ :indices | 'Now processing ' , (indices first @ indices last) asString ])
		elementOn:
			{currentLeftRow.
			currentRightColumn}.
	visualizer add: nowProcessingElementIndex.
	visualizer group: #nowProcessing.
	leftMarkerElement := (COOSparseMatrixVisualizer new
		getElementShapeScaled: 5) elementOn: leftMatrixMarker.
	visualizer add: leftMarkerElement.
	visualizer group: #leftMarker.
	rightMarkerElement := (COOSparseMatrixVisualizer new
		getElementShapeScaled: 5) elementOn: rightMatrixMarker.
	visualizer add: rightMarkerElement.
	visualizer group: #rightMarker.
	visualizer setPositionsForMultiplication.
	visualizer
		namedGroups: #(#left #result #right #leftMarker #rightMarker).
	visualizer backgroundGroups: #(#left #result #right).
	visualizer update.
	sum := 0.
	self
		withEscaper: [ :end | 
			[ rightMatrixMarker isNotNil or: [ leftMatrixMarker isNotNil ] ]
				whileTrue: [ self
						withEscaper: [ :outer | 
							"Switch to next row in left and reset right marker if right ended"
							rightMatrixMarker isNil
								ifTrue: [ rightMatrixMarker := transposed first.
									leftSavedMatrixMarker := leftMatrixMarker.
									leftMarkerElement updateModelAndRedraw: leftMatrixMarker.
									rightMarkerElement updateModelAndRedraw: rightMatrixMarker.
									(Delay forSeconds: delay) wait ].
							"reset left marker to row beginning"
							(Delay forSeconds: delay) wait.
							leftMatrixMarker := leftSavedMatrixMarker.
							leftMarkerElement updateModelAndRedraw: leftMatrixMarker.
							(Delay forSeconds: delay) wait.
							currentLeftRow := leftMatrixMarker row.
							currentRightColumn := rightMatrixMarker row.
							nowProcessingElementIndex
								model:
									{currentLeftRow.
									currentRightColumn}.
							nowProcessingElementIndex update.
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
												whileTrue: [ leftMatrixMarker := leftMatrixMarker rightNeighbour.
													leftMarkerElement updateModelAndRedraw: leftMatrixMarker.
													(Delay forSeconds: delay) wait ].
											leftMatrixMarker isNil
												ifTrue: [ [ rightMatrixMarker isNotNil
														and: [ rightMatrixMarker row = currentRightColumn ] ]
														whileTrue: [ rightMatrixMarker := rightMatrixMarker rightNeighbour.
															rightMatrixMarker isNotNil
																ifTrue: [ rightMarkerElement updateModelAndRedraw: rightMatrixMarker.
																	(Delay forSeconds: delay) wait ] ].

													"If no intersection - end"
													rightMatrixMarker isNil
														ifTrue: [ end value ].
													"Else - continue loop"
													next value ].
											leftMatrixMarker row ~= currentLeftRow
												ifTrue: [ [ rightMatrixMarker isNotNil
														and: [ rightMatrixMarker row = currentRightColumn ] ]
														whileTrue: [ rightMatrixMarker := rightMatrixMarker rightNeighbour.
															rightMatrixMarker isNotNil
																ifTrue: [ rightMarkerElement updateModelAndRedraw: rightMatrixMarker.
																	(Delay forSeconds: delay) wait ] ].
													next value ].
											priorityColumn := leftMatrixMarker column.

											"Find same column as prioritized or higher in right"
											[ rightMatrixMarker isNotNil
												and: [ rightMatrixMarker row = currentRightColumn
														and: [ rightMatrixMarker column < priorityColumn ] ] ]
												whileTrue: [ rightMatrixMarker := rightMatrixMarker rightNeighbour.
													rightMatrixMarker isNotNil
														ifTrue: [ rightMarkerElement updateModelAndRedraw: rightMatrixMarker ].
													(Delay forSeconds: delay) wait ].
											rightMatrixMarker isNil
												ifTrue: [ [ leftMatrixMarker isNotNil
														and: [ leftMatrixMarker row = currentLeftRow ] ]
														whileTrue: [ leftMatrixMarker := leftMatrixMarker rightNeighbour.
															leftMatrixMarker isNotNil
																ifTrue: [ leftMarkerElement updateModelAndRedraw: leftMatrixMarker ].
															(Delay forSeconds: delay) wait ].

													"If no intersections - end"
													leftMatrixMarker isNil
														ifTrue: [ end value ].
													"Else - continue loop"
													next value ].
											rightMatrixMarker row ~= currentRightColumn
												ifTrue: [ next value ].
											leftMatrixMarker column = rightMatrixMarker column
												ifTrue: [ visualizer highlightModel: leftMatrixMarker inGroup: #left.
													visualizer
														highlightModel: rightMatrixMarker
														inGroup: #right.
													(Delay forSeconds: delay) wait.
													sum := sum
														+ (leftMatrixMarker value * rightMatrixMarker value).
													leftMatrixMarker := leftMatrixMarker rightNeighbour.
													rightMatrixMarker := rightMatrixMarker rightNeighbour.
													leftMarkerElement updateModelAndRedraw: leftMatrixMarker.
													rightMatrixMarker isNotNil
														ifTrue: [ rightMarkerElement updateModelAndRedraw: rightMatrixMarker ].
													(Delay forSeconds: delay) wait ]
												ifFalse: [ priorityColumn := rightMatrixMarker column ] ] ].
							sum = 0
								ifFalse: [ newNode := COOSparseMatrixNode
										row: currentLeftRow
										column: currentRightColumn
										value: sum.
									result last rightNeighbour: newNode.
									newNode leftNeighbour: result last.
									result last: newNode.
									sum := 0.
									visualizer updateResultWith: result ] ].
					sum = 0
						ifFalse: [ newNode := COOSparseMatrixNode
								row: currentLeftRow
								column: currentRightColumn
								value: sum.
							result last rightNeighbour: newNode.
							newNode leftNeighbour: result last.
							result last: newNode.
							sum := 0.
							visualizer updateResultWith: result ] ] ].
	"nil the reference to dummy head"
	result first rightNeighbour leftNeighbour: nil.
	result first: result first rightNeighbour.
	visualizer updateResultWith: result ].
	operationProcess := operationBlock newProcess.
	visualizer setUpMenuWithProcess: operationProcess.
	^ visualizer view