*LNU-SparseMatrix-Visual
byMatrixAnimated: aLILSparseMatrix delay: delay
	| result other index sum list arr cachedLeftRow cachedRightColumn vis operationProcess leftMarkerElement rightMarkerElement nowProcessingElementIndex newElementValue captionLabel newRowGroup |
	columnNumber = aLILSparseMatrix rowNumber
		ifFalse: [ Error signal: 'Invalid matrix sizes' ].
	(aLILSparseMatrix isEmpty or: [ self isEmpty ])
		ifTrue:
			[ ^ self class rows: rowNumber columns: aLILSparseMatrix columnNumber ].
	other := aLILSparseMatrix transpose.
	result := self class
		rows: rowNumber
		columns: aLILSparseMatrix columnNumber.
	vis := MatrixOperationVisualizer new.
	vis delay: delay.
	vis getComposedViewOf: self with: other result: result.
	vis namedGroups: #(#left #result #right #leftMarker #rightMarker).
	vis backgroundGroups: #(#left #result #right).
	leftMarkerElement := (LILSparseMatrixVisualizer new
		getElementShapeScaled: 5)
		elementOn: (MatrixElement row: 0 column: 0 value: 0).
	vis add: leftMarkerElement.
	vis group: #leftMarker.
	rightMarkerElement := (LILSparseMatrixVisualizer new
		getElementShapeScaled: 5)
		elementOn: (MatrixElement row: 0 column: 0 value: 0).
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
	operationProcess := [ arr := (1 to: result rowNumber)
		collect: [ :rowIndex | 
			list := LinkedList with: (LILSparseMatrixNode new column: 0).
			newRowGroup := #newRow , rowIndex asString.
			(vis composer hasGroup: newRowGroup)
				ifTrue: [ vis composer removeGroup: newRowGroup ].
			LILSparseMatrixVisualizer
				onLinkedList: list
				inRow: rowIndex
				withView: vis view.
			vis group: newRowGroup.
			vis composer move: newRowGroup above: #nowProcessing.
			cachedLeftRow := rows at: rowIndex.
			1 to: result columnNumber do: [ :columnIndex | 
				nowProcessingElementIndex
					model:
						{rowIndex.
						columnIndex}.
				nowProcessingElementIndex update.
				vis delay wait.
				cachedRightColumn := other rows at: columnIndex.
				sum := (cachedLeftRow
					collect: [ :leftNode | 
						index := cachedRightColumn
							findFirst: [ :rightNode | rightNode column = leftNode column ].
						leftMarkerElement
							updateModelAndRedraw:
								(MatrixElement
									row: rowIndex
									column: leftNode column
									value: leftNode value).
						vis composer
							selectUsing: [ :element | element source = leftNode ]
							inGroup: #left.
						vis delay wait.
						index = 0
							ifTrue: [ vis composer
									deselectUsing: [ :element | element source = leftNode ]
									inGroup: #left.
								nil ]
							ifFalse: [ rightMarkerElement
									updateModelAndRedraw:
										(MatrixElement
											row: rowIndex
											column: (cachedRightColumn at: index) column
											value: (cachedRightColumn at: index) value).
								vis composer
									highlightUsing: [ :element | element source = leftNode ]
									inGroup: #left.
								vis composer
									highlightUsing: [ :element | element source = (cachedRightColumn at: index) ]
									inGroup: #right.
								vis delay wait.
								vis composer
									deselectUsing: [ :element | element source = leftNode ]
									inGroup: #left.
								vis composer
									deselectUsing: [ :element | element source = (cachedRightColumn at: index) ]
									inGroup: #right.
								newElementValue
									model:
										newElementValue model
											+ (leftNode value * (cachedRightColumn at: index) value).
								newElementValue update.
								leftNode value * (cachedRightColumn at: index) value ] ]
					thenReject: [ :el | el isNil ]) detectSum: [ :each | each ].
				vis delay wait.
				sum = 0
					ifFalse: [ list addLast: (LILSparseMatrixNode column: columnIndex value: sum).
						sum := 0.
						vis composer removeGroup: newRowGroup.
						LILSparseMatrixVisualizer
							onLinkedList: list
							inRow: rowIndex
							withView: vis view.
						vis group: newRowGroup.
						vis composer move: newRowGroup above: #nowProcessing.
						newElementValue model: 0.
						newElementValue update.
						vis redrawNamesAndBackgrounds.
						vis composer view canvas focusOnCenterScaled.
						vis delay wait ] ].
			captionLabel := (RTLabel
				text: Character arrowLeft asString , 'List for row ' , rowIndex asString)
				element.
			list isEmpty
				ifFalse: [ rowIndex = 1
						ifTrue: [ vis composer move: newRowGroup onTheRightBelowOf: #result ]
						ifFalse: [ self
								withEscaper: [ :break | 
									(1 to: rowIndex - 1) reverse
										detect: [ :row | vis composer hasGroup: #newRow , row asString ]
										ifFound: [ :previousRow | 
											vis composer move: newRowGroup below: #newRow , previousRow asString.
											break value ] ] ].
					vis add: captionLabel.
					vis group: newRowGroup , #Caption.
					vis composer
						move: newRowGroup , #Caption
						onTheRightOf: newRowGroup ].
			vis composer view canvas focusOnCenterScaled.
			list ].
		vis composer removeGroup: #leftMarker.
		vis composer removeGroup: #rightMarker.
			arr
		keysAndValuesDo: [ :i :li | 
			result rows at: i put: li copyWithoutFirst.
			(vis composer hasGroup: #newRow , i asString)
				ifTrue: [ vis composer removeGroup: #newRow , i asString.
					vis composer removeGroup: #newRow , i asString , #Caption ].
			vis updateResultWith: result.
			vis composer view canvas focusOnCenterScaled.
			vis delay wait ] ] newProcess.
	vis setUpMenuWithProcess: operationProcess.
	^ vis view