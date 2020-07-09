*LNU-SparseMatrix-Visual
addAnimated: aMatrix delay: delay
	"Addition of matrices of the same type"

	| result rowNumbers colNumbers colLast leftRowMarker rightRowMarker tail vis operationProcess leftMarkerElement rightMarkerElement nowProcessingElementIndex |
	(rowNumber = aMatrix rowNumber
		and: [ columnNumber = aMatrix columnNumber ])
		ifFalse: [ Error signal: 'Matrices must be of same size.' ].
	result := self class rows: rowNumber columns: columnNumber.
	vis := MatrixOperationVisualizer new.
	vis delay: delay.
	vis getComposedViewOf: self with: aMatrix result: result.
	vis namedGroups: #(#left #result #right #leftMarker #rightMarker).
	vis backgroundGroups: #(#left #result #right).
	leftMarkerElement := (TWSparseMatrixVisualizer new
		getElementShapeScaled: 5)
		elementOn: (TWSparseMatrixNode new value: 0 row: 0 column: 0).
	vis add: leftMarkerElement.
	vis group: #leftMarker.
	rightMarkerElement := (TWSparseMatrixVisualizer new
		getElementShapeScaled: 5)
		elementOn: (TWSparseMatrixNode new value: 0 row: 0 column: 0).
	vis add: rightMarkerElement.
	vis group: #rightMarker.
	nowProcessingElementIndex := (RTLabel
		text:
			[ :indices | 'Now processing ' , (indices first @ indices last) asString ])
		elementOn: {0 . 0}.
	vis add: nowProcessingElementIndex.
	vis group: #nowProcessing.
	vis composer move: #leftMarker below: #left.
	vis composer move: #rightMarker below: #right.
	vis composer move: #nowProcessing above: #right.
	vis redrawNamesAndBackgrounds.
	vis composer groupToExisting: #labels.
	vis update.
	"Filter out the rows and columns that don't have elements"
	operationProcess := [ "rowNumbers, colNumbers - indices which exist"
	rowNumbers := ((rows
		reject: [ :rowHead | rowHead rightNeighbour = rowHead ])
		collect: [ :rowHead | rowHead row ])
		union:
			((aMatrix rows reject: [ :rowHead | rowHead rightNeighbour = rowHead ])
				collect: [ :rowHead | rowHead row ]).
	colNumbers := ((columns
		reject: [ :colHead | colHead belowNeighbour = colHead ])
		collect: [ :colHead | colHead column ])
		union:
			((aMatrix columns
				reject: [ :colHead | colHead belowNeighbour = colHead ])
				collect: [ :colHead | colHead column ]).
	"gray out rows which are empty"
	((1 to: self rowsNumber) copyWithoutAll: rowNumbers)
		do: [ :rowIndex | 
			| backgroundBoxLeft backgroundBoxRight outterGap |
			outterGap := 5 @ 5.
			backgroundBoxLeft := TRRoundedBoxShape new.
			backgroundBoxLeft color: (Color gray alpha: 0.5).
			backgroundBoxLeft strokeWidth: 0.
			backgroundBoxLeft borderRadius: 5.
			backgroundBoxLeft
				translateTo:
					(vis composer getGroup: #left) center x
						@ (vis view elementFromModel: (rows at: rowIndex)) center y.
			backgroundBoxLeft
				extent:
					(vis composer getGroup: #left) extent x
						@ (vis view elementFromModel: (rows at: rowIndex)) extent y
						+ outterGap.
			backgroundBoxRight := TRRoundedBoxShape new.
			backgroundBoxRight color: (Color gray alpha: 0.5).
			backgroundBoxRight strokeWidth: 0.
			backgroundBoxRight borderRadius: 5.
			backgroundBoxRight
				translateTo:
					(vis composer getGroup: #right) center x
						@ (vis view elementFromModel: (aMatrix rows at: rowIndex)) center y.
			backgroundBoxRight
				extent:
					(vis composer getGroup: #right) extent x
						@ (vis view elementFromModel: (aMatrix rows at: rowIndex)) extent y
						+ outterGap.
			vis view canvas addShape: backgroundBoxLeft.
			vis view canvas addShape: backgroundBoxRight.
			(vis composer hasGroup: #shade)
				ifTrue: [ vis composer groupToExisting: #shade ]
				ifFalse: [ vis group: #shade ] ].
	"gray out empty columns"
	((1 to: self columnsNumber) copyWithoutAll: colNumbers)
		do: [ :rowIndex | 
			| backgroundBoxLeft backgroundBoxRight outterGap |
			outterGap := 5 @ 5.
			backgroundBoxLeft := TRRoundedBoxShape new.
			backgroundBoxLeft color: (Color gray alpha: 0.5).
			backgroundBoxLeft strokeWidth: 0.
			backgroundBoxLeft borderRadius: 5.
			backgroundBoxLeft
				translateTo:
					(vis view elementFromModel: (rows at: rowIndex)) center x
						@ (vis composer getGroup: #left) center y.
			backgroundBoxLeft
				extent:
					(vis view elementFromModel: (rows at: rowIndex)) extent x
						@ (vis composer getGroup: #left) extent y + outterGap.
			backgroundBoxRight := TRRoundedBoxShape new.
			backgroundBoxRight color: (Color gray alpha: 0.5).
			backgroundBoxRight strokeWidth: 0.
			backgroundBoxRight borderRadius: 5.
			backgroundBoxRight
				translateTo:
					(vis view elementFromModel: (aMatrix rows at: rowIndex)) center x
						@ (vis composer getGroup: #right) center y.
			backgroundBoxRight
				extent:
					(vis view elementFromModel: (aMatrix rows at: rowIndex)) extent x
						@ (vis composer getGroup: #right) extent y + outterGap.
			vis view canvas addShape: backgroundBoxLeft.
			vis view canvas addShape: backgroundBoxRight.
			(vis composer hasGroup: #shade)
				ifTrue: [ vis composer groupToExisting: #shade ]
				ifFalse: [ vis group: #shade ] ].
	"Initialize an array that has all the last elements in columns"
	colLast := result columns
		select: [ :colHead | colNumbers includes: colHead column ].

	"loop through each row"
	rowNumbers
		do: [ :rowIndex | 
			leftRowMarker := (rows at: rowIndex) rightNeighbour.
			rightRowMarker := (aMatrix rows at: rowIndex) rightNeighbour.
			leftMarkerElement updateModelAndRedraw: leftRowMarker.
			rightMarkerElement updateModelAndRedraw: rightRowMarker.
			leftRowMarker column ~= 0
				ifTrue: [ vis composer selectModel: leftRowMarker ].
			rightRowMarker column ~= 0
				ifTrue: [ vis composer selectModel: rightRowMarker ].
			tail := result rows at: rowIndex.
			[ leftRowMarker column ~= 0 and: [ rightRowMarker column ~= 0 ] ]
				whileTrue: [ leftRowMarker column < rightRowMarker column
						ifTrue: [ tail
								rightNeighbour:
									(TWSparseMatrixNode
										row: rowIndex
										column: leftRowMarker column
										value: leftRowMarker value).
							nowProcessingElementIndex
								model:
									{rowIndex.
									leftRowMarker column}.
							nowProcessingElementIndex update.
							vis composer highlightModel: leftRowMarker.
							vis updateResultWith: result.
							vis composer view canvas focusOnCenterScaled.
							vis delay wait.
							vis composer deselectModel: leftRowMarker.
							leftRowMarker := leftRowMarker rightNeighbour.
							leftMarkerElement updateModelAndRedraw: leftRowMarker.
							leftRowMarker column ~= 0
								ifTrue: [ vis composer selectModel: leftRowMarker ] ]
						ifFalse: [ leftRowMarker column > rightRowMarker column
								ifTrue: [ tail
										rightNeighbour:
											(TWSparseMatrixNode
												row: rowIndex
												column: rightRowMarker column
												value: rightRowMarker value).
									nowProcessingElementIndex
										model:
											{rowIndex.
											rightRowMarker column}.
									nowProcessingElementIndex update.
									vis composer highlightModel: rightRowMarker.
									vis updateResultWith: result.
									vis composer view canvas focusOnCenterScaled.
									vis delay wait.
									vis composer deselectModel: rightRowMarker.
									rightRowMarker := rightRowMarker rightNeighbour.
									rightMarkerElement updateModelAndRedraw: rightRowMarker.
									rightRowMarker column ~= 0
										ifTrue: [ vis composer selectModel: rightRowMarker ] ]
								ifFalse: [ "if there's an element on the same index"
									rightRowMarker value + leftRowMarker value = 0
										ifFalse: [ tail
												rightNeighbour:
													(TWSparseMatrixNode
														row: rowIndex
														column: rightRowMarker column
														value: rightRowMarker value + leftRowMarker value).
											nowProcessingElementIndex
												model:
													{rowIndex.
													leftRowMarker column}.
											nowProcessingElementIndex update.
											vis composer highlightModel: rightRowMarker.
											vis composer highlightModel: leftRowMarker.
											vis updateResultWith: result.
											vis composer view canvas focusOnCenterScaled.
											vis delay wait ].
									vis composer deselectModel: rightRowMarker.
									vis composer deselectModel: leftRowMarker.
									rightRowMarker := rightRowMarker rightNeighbour.
									leftRowMarker := leftRowMarker rightNeighbour.
									rightRowMarker column ~= 0
										ifTrue: [ vis composer selectModel: rightRowMarker ].
									leftRowMarker column ~= 0
										ifTrue: [ vis composer selectModel: leftRowMarker ].
									leftMarkerElement updateModelAndRedraw: leftRowMarker.
									rightMarkerElement updateModelAndRedraw: rightRowMarker.
									vis delay wait ] ].
					tail rightNeighbour isNotNil
						ifTrue: [ tail := tail rightNeighbour ] ].

			"gather leftovers from left matrix"
			[ leftRowMarker column ~= 0 ]
				whileTrue: [ tail
						rightNeighbour:
							(TWSparseMatrixNode
								row: rowIndex
								column: leftRowMarker column
								value: leftRowMarker value).
					nowProcessingElementIndex
						model:
							{rowIndex.
							leftRowMarker column}.
					nowProcessingElementIndex update.
					vis composer highlightModel: leftRowMarker.
					vis updateResultWith: result.
					vis composer view canvas focusOnCenterScaled.
					vis delay wait.
					vis composer deselectModel: leftRowMarker.
					leftRowMarker column ~= 0
						ifTrue: [ leftRowMarker := leftRowMarker rightNeighbour ].
					leftMarkerElement updateModelAndRedraw: leftRowMarker.
					vis composer selectModel: leftRowMarker.
					tail := tail rightNeighbour ].

			"gather leftovers from right matrix"
			[ rightRowMarker column ~= 0 ]
				whileTrue: [ tail
						rightNeighbour:
							(TWSparseMatrixNode
								row: rowIndex
								column: rightRowMarker column
								value: rightRowMarker value).
					nowProcessingElementIndex
						model:
							{rowIndex.
							rightRowMarker column}.
					nowProcessingElementIndex update.
					vis composer highlightModel: rightRowMarker.
					vis updateResultWith: result.
					vis composer view canvas focusOnCenterScaled.
					vis delay wait.
					vis composer deselectModel: rightRowMarker.
					rightRowMarker := rightRowMarker rightNeighbour.
					rightMarkerElement updateModelAndRedraw: rightRowMarker.
					rightRowMarker column ~= 0
						ifTrue: [ vis composer deselectModel: rightRowMarker ].
					tail := tail rightNeighbour ].

			"close loop the row"
			tail rightNeighbour: (result rows at: rowIndex).
			vis updateResultWith: result.
			vis composer view canvas focusOnCenterScaled.
			vis delay wait.

			"shift last elements in columns up-to-down"
			"bind the new elements to the column headers"
			tail := (result rows at: rowIndex) rightNeighbour.
			[ tail column ~= 0 ]
				whileTrue: [ (colLast at: tail column) belowNeighbour: tail.
					colLast at: tail column put: tail.
					tail := tail rightNeighbour.
					vis updateResultWith: result.
					vis composer view canvas focusOnCenterScaled.
					vis delay wait ] ].
	vis composer removeGroup: #leftMarker.
	vis composer removeGroup: #rightMarker.
	vis
		namedGroups: (vis namedGroups copyWithoutAll: #(#leftMarker #rightMarker)).
	vis redrawNamesAndBackgrounds.
	"close loop on the columns"
	colLast
		do: [ :colLastElement | 
			colLastElement
				belowNeighbour: (result columns at: colLastElement column).
			vis updateResultWith: result.
			vis composer view canvas focusOnCenterScaled.
			vis delay wait ] ] newProcess.
	vis setUpMenuWithProcess: operationProcess.
	^ vis view