*LNU-SparseMatrix-Visual
transposeAnimatedDelay: delay
	| copy rowMarker result columnMarkers vis operationProcess sourceMarker |
	result := self class rows: columnNumber columns: rowNumber.
	self isEmpty
		ifTrue: [ ^ result ].
	vis := MatrixOperationVisualizer new.
	vis delay: delay.
	MatrixVisualizer on: self withView: vis view.
	vis composer group: #source.
	MatrixVisualizer on: result withView: vis view.
	vis composer group: #result.
	sourceMarker := (TWSparseMatrixVisualizer new
		getElementShapeScaled: 5)
		elementOn: (TWSparseMatrixNode new value: 0 row: 0 column: 0).
	vis add: sourceMarker.
	vis group: #sourceMarker.
	vis composer move: #sourceMarker below: #source.
	vis composer move: #result onTheRightOf: #source.
	vis namedGroups: #(#source #result #sourceMarker).
	vis backgroundGroups: #(#source #result).
	vis redrawNamesAndBackgrounds.
	operationProcess := [ columnMarkers := result columns copy.
	result rows
		withIndexDo: [ :each :rowIndex | 
			copy := self columns at: rowIndex.
			rowMarker := each.
			sourceMarker updateModelAndRedraw: rowMarker.
			[ copy belowNeighbour row ~= 0 ]
				whileTrue: [ copy := copy belowNeighbour.
					vis selectModel: copy.
					sourceMarker updateModelAndRedraw: copy.
					rowMarker
						rightNeighbour:
							(TWSparseMatrixNode new
								value: copy value
								row: copy column
								column: copy row).
					(columnMarkers at: copy row)
						belowNeighbour: rowMarker rightNeighbour.
					vis composer replaceElementsInGroup: #result with: result.
					vis composer move: #result onTheRightOf: #source.
					vis composer view canvas focusOnCenterScaled.
					vis delay wait.
					vis deselectModel: copy.
					columnMarkers at: copy row put: rowMarker rightNeighbour.
					rowMarker := rowMarker rightNeighbour ].
			rowMarker rightNeighbour: each.
			vis composer replaceElementsInGroup: #result with: result.
			vis composer move: #result onTheRightOf: #source.
			vis composer view canvas focusOnCenterScaled.
			vis delay wait ].
	result columns
		withIndexDo:
			[ :each :columnIndex | (columnMarkers at: columnIndex) belowNeighbour: each ].
	vis composer removeGroup: #sourceMarker.
	vis namedGroups: (vis namedGroups copyWithout: #sourceMarker).
	vis redrawNamesAndBackgrounds.
	vis composer replaceElementsInGroup: #result with: result.
	vis composer move: #result onTheRightOf: #source.
	vis composer view canvas focusOnCenterScaled.
	vis delay wait ] newProcess.
	vis setUpMenuWithProcess: operationProcess.
	^ vis view