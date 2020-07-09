*LNU-SparseMatrix-Visual
byMatrixAnimated: aMatrix delay: delay
	| result rowNumbers columnNumbers lastInRowMarkers lastInColumnMarkers leftMarker rightMarker sum newNode vis operationProcess leftMarkerElement rightMarkerElement nowProcessingElementIndex newElementValue leftCopy |
	self columnNumber ~= aMatrix rowNumber
		ifTrue: [ Error
				signal:
					'Size mismatch. Left: ' , self columnNumber , ' Right: '
						, aMatrix rowNumber ].
	result := self class new
		rows: self rowNumber
		columns: aMatrix columnNumber.
	(self isEmpty or: aMatrix isEmpty)
		ifTrue: [ ^ result ].
	leftCopy := aMatrix copy.
	vis := MatrixOperationVisualizer new.
	vis delay: delay.
	vis getComposedViewOf: self with: leftCopy result: result.
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
	newElementValue := (RTLabel
		text: [ :value | 'New element value: ' , value asString ])
		elementOn: 0.
	vis add: newElementValue.
	vis group: #newElementValue.
	vis composer move: #leftMarker below: #left.
	vis composer move: #rightMarker below: #right.
	vis composer move: #nowProcessing above: #right.
	vis composer move: #newElementValue onTheRightOf: #nowProcessing.
	vis redrawNamesAndBackgrounds.
	vis composer groupToExisting: #labels.
	vis update.
	lastInRowMarkers := result rows copy.
	lastInColumnMarkers := result columns copy.
	rowNumbers := self rows
		reject: [ :rowHead | rowHead rightNeighbour = rowHead ]
		thenCollect: [ :rowHead | rowHead row ].
	columnNumbers := leftCopy rows
		reject: [ :colHead | colHead belowNeighbour = colHead ]
		thenCollect: [ :colHead | colHead row ].

	"gray out rows which are empty"
	((1 to: self rowNumber) copyWithoutAll: rowNumbers)
		do: [ :rowIndex | 
			| backgroundBoxLeft backgroundBoxResult outterGap |
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
			backgroundBoxResult := TRRoundedBoxShape new.
			backgroundBoxResult color: (Color gray alpha: 0.5).
			backgroundBoxResult strokeWidth: 0.
			backgroundBoxResult borderRadius: 5.
			backgroundBoxResult
				translateTo:
					(vis composer getGroup: #result) center x
						@ (vis view elementFromModel: (result rows at: rowIndex)) center y.
			backgroundBoxResult
				extent:
					(vis composer getGroup: #result) extent x
						@ (vis view elementFromModel: (result rows at: rowIndex)) extent y
						+ outterGap.
			vis view canvas addShape: backgroundBoxLeft.
			vis view canvas addShape: backgroundBoxResult.
			(vis composer hasGroup: #shade)
				ifTrue: [ vis composer groupToExisting: #shade ]
				ifFalse: [ vis group: #shade ] ].
	"gray out empty columns"
	((1 to: self columnNumber) copyWithoutAll: columnNumbers)
		do: [ :rowIndex | 
			| backgroundBoxResult backgroundBoxRight outterGap |
			outterGap := 5 @ 5.
			backgroundBoxRight := TRRoundedBoxShape new.
			backgroundBoxRight color: (Color gray alpha: 0.5).
			backgroundBoxRight strokeWidth: 0.
			backgroundBoxRight borderRadius: 5.
			backgroundBoxRight
				translateTo:
					(vis view elementFromModel: (leftCopy rows at: rowIndex)) center x
						@ (vis composer getGroup: #right) center y.
			backgroundBoxRight
				extent:
					(vis view elementFromModel: (leftCopy rows at: rowIndex)) extent x
						@ (vis composer getGroup: #right) extent y + outterGap.
			backgroundBoxResult := TRRoundedBoxShape new.
			backgroundBoxResult color: (Color gray alpha: 0.5).
			backgroundBoxResult strokeWidth: 0.
			backgroundBoxResult borderRadius: 5.
			backgroundBoxResult
				translateTo:
					(vis view elementFromModel: (result rows at: rowIndex)) center x
						@ (vis composer getGroup: #result) center y.
			backgroundBoxResult
				extent:
					(vis view elementFromModel: (result rows at: rowIndex)) extent x
						@ (vis composer getGroup: #result) extent y + outterGap.
			vis view canvas addShape: backgroundBoxRight.
			vis view canvas addShape: backgroundBoxResult.
			(vis composer hasGroup: #shade)
				ifTrue: [ vis composer groupToExisting: #shade ]
				ifFalse: [ vis group: #shade ] ].
	operationProcess := [ rowNumbers
		do: [ :rowIndex | 
			columnNumbers
				do: [ :columnIndex | 
					leftMarker := (self rows at: rowIndex) rightNeighbour.
					rightMarker := (leftCopy columns at: columnIndex) belowNeighbour.
					nowProcessingElementIndex
						model:
							{rowIndex.
							columnIndex}.
					sum := 0.
					newElementValue model: sum.
					newElementValue update.
					nowProcessingElementIndex update.
					leftMarkerElement updateModelAndRedraw: leftMarker.
					rightMarkerElement updateModelAndRedraw: rightMarker.
					leftMarker column ~= 0
						ifTrue: [ vis composer selectModel: leftMarker.
							vis delay wait ].
					rightMarker row ~= 0
						ifTrue: [ vis composer selectModel: rightMarker.
							vis delay wait ].
					vis delay wait.
					[ leftMarker column ~= 0 and: [ rightMarker row ~= 0 ] ]
						whileTrue: [ leftMarker column < rightMarker row
								ifTrue: [ vis composer deselectModel: leftMarker.
									leftMarker := leftMarker rightNeighbour.
									leftMarkerElement updateModelAndRedraw: leftMarker.
									leftMarker column ~= 0
										ifTrue: [ vis composer selectModel: leftMarker.
											vis delay wait ] ]
								ifFalse: [ leftMarker column > rightMarker row
										ifTrue: [ vis composer deselectModel: rightMarker.
											rightMarker := rightMarker belowNeighbour.
											rightMarkerElement updateModelAndRedraw: rightMarker.
											rightMarker row ~= 0
												ifTrue: [ vis composer selectModel: rightMarker.
													vis delay wait ] ]
										ifFalse: [ vis composer highlightModel: rightMarker.
											vis composer highlightModel: leftMarker.
											vis delay wait.
											sum := sum + (leftMarker value * rightMarker value).
											newElementValue model: sum.
											newElementValue update.
											vis composer deselectModel: rightMarker.
											vis composer deselectModel: leftMarker.
											rightMarker := rightMarker belowNeighbour.
											leftMarker := leftMarker rightNeighbour.
											rightMarker row ~= 0
												ifTrue: [ vis composer selectModel: rightMarker ].
											leftMarker column ~= 0
												ifTrue: [ vis composer selectModel: leftMarker ].
											leftMarkerElement updateModelAndRedraw: leftMarker.
											rightMarkerElement updateModelAndRedraw: rightMarker.
											vis delay wait ] ] ].
					rightMarker row ~= 0
						ifTrue: [ vis composer deselectModel: rightMarker ].
					leftMarker column ~= 0
						ifTrue: [ vis composer deselectModel: leftMarker ].
					sum ~= 0
						ifTrue: [ newNode := TWSparseMatrixNode new
								value: sum
								row: rowIndex
								column: columnIndex.
							(lastInRowMarkers at: rowIndex) rightNeighbour: newNode.
							(lastInColumnMarkers at: columnIndex) belowNeighbour: newNode.
							lastInRowMarkers at: rowIndex put: newNode.
							lastInColumnMarkers at: columnIndex put: newNode.
							vis updateResultWith: result.
							vis composer view canvas focusOnCenterScaled.
							vis delay wait ] ] ].
	vis composer removeGroup: #leftMarker.
	vis composer removeGroup: #rightMarker.
	vis composer removeGroup: #nowProcessing.
	vis composer removeGroup: #newElementValue.
	vis
		namedGroups: (vis namedGroups copyWithoutAll: #(#leftMarker #rightMarker)).
	vis redrawNamesAndBackgrounds.
	result rows
		withIndexDo: [ :rowHead :rowIndex | 
			(lastInRowMarkers at: rowIndex) rightNeighbour: rowHead
			"vis updateResultWith: result.
			vis delay wait " ].
	result columns
		withIndexDo: [ :colHead :colIndex | 
			(lastInColumnMarkers at: colIndex) belowNeighbour: colHead
			"vis updateResultWith: result.
			vis delay wait" ].
	vis updateResultWith: result ] newProcess.
	vis setUpMenuWithProcess: operationProcess.
	^ vis view