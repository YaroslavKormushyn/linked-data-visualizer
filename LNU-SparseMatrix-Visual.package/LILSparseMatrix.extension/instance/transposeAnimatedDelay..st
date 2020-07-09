*LNU-SparseMatrix-Visual
transposeAnimatedDelay: delay
	| result tempList index vis operationProcess sourceMarker |
	result := self class rows: columnNumber columns: rowNumber.
	vis := MatrixOperationVisualizer new.
	vis delay: delay.
	MatrixVisualizer on: self withView: vis view.
	vis composer group: #source.
	MatrixVisualizer on: result withView: vis view.
	vis composer group: #result.
	sourceMarker := (LILSparseMatrixVisualizer new
		getElementShapeScaled: 5)
		elementOn: (MatrixElement row: 0 column: 0 value: 0).
	vis add: sourceMarker.
	vis group: #sourceMarker.
	vis composer move: #sourceMarker below: #source.
	vis composer move: #result onTheRightOf: #source.
	vis composer nameGroup: #sourceMarker as: 'sourceMarker'.
	vis composer nameGroup: #source as: 'source'.
	vis composer nameGroup: #result as: 'result'.
	vis composer
		setBackgroundColor: (Color gray alpha: 0.2)
		forGroup: #source.
	vis composer group: #labels.
	vis namedGroups: #(#source #sourceMarker #result).
	vis backgroundGroups: #(#source #result).
	operationProcess := [ | newRowGroup captionLabel |
	1 to: columnNumber do: [ :columnIndex | 
		tempList := LinkedList new.
		newRowGroup := #newRow.
		captionLabel := (RTLabel
			text: Character arrowLeft asString , 'List for row ' , columnIndex asString)
			element.
		vis add: captionLabel.
		vis group: #newRowLabel.
		vis composer move: #newRowLabel above: #source.
		1 to: rowNumber do: [ :rowIndex | 
			(self rows at: rowIndex) isEmpty
				ifFalse: [ (self rows at: rowIndex) first
						ifNotNil: [ index := (self rows at: rowIndex)
								findFirst: [ :element | element column = columnIndex ].
							index = 0
								ifFalse: [ | sourceElement |
									sourceElement := (self rows at: rowIndex) at: index.
									vis composer
										selectUsing: [ :model | model source = sourceElement ]
										inGroup: #source.
									sourceMarker
										updateModelAndRedraw:
											(MatrixElement
												row: rowIndex
												column: sourceElement column
												value: sourceElement value
												source: sourceElement).
									vis delay wait.
									(vis composer hasGroup: #newRow)
										ifTrue: [ vis composer removeGroup: #newRow ].
									tempList
										addLast: (LILSparseMatrixNode column: rowIndex value: sourceElement value).
									LILSparseMatrixVisualizer
										onLinkedList: tempList
										inRow: columnIndex
										withView: vis view.
									vis group: newRowGroup.
									vis composer
										deselectUsing: [ :model | model source = sourceElement ]
										inGroup: #source.
									vis composer move: newRowGroup onTheRightOf: #newRowLabel.
									vis composer redrawNamesFor: vis namedGroups.
									vis composer redrawBackgroundsFor: vis backgroundGroups.
									vis composer view canvas focusOnCenterScaled.
									vis delay wait ] ] ] ].
		(vis composer hasGroup: #newRow)
			ifTrue: [ vis composer removeGroup: #newRow ].
		vis composer removeGroup: #newRowLabel.
		result rows at: columnIndex put: tempList.
		vis composer replaceElementsInGroup: #result with: result.
		vis composer move: #result onTheRightOf: #source.
		vis composer view canvas focusOnCenterScaled.
		vis delay wait ].
	vis composer removeGroup: #sourceMarker.
	vis namedGroups: (vis namedGroups copyWithout: #sourceMarker).
	vis redrawNamesAndBackgrounds.
	vis composer view canvas focusOnCenterScaled ] newProcess.
	vis setUpMenuWithProcess: operationProcess.
	^ vis view