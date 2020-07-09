*LNU-SparseMatrix-Visual
transposeAnimatedDelay: delay
	| result tempList marker vis operationProcess sourceMarker rightMarkerElement nowProcessingElementIndex newElementValue captionLabel newRowGroup |
	result := self class rows: columnNumber columns: rowNumber.
	vis := MatrixOperationVisualizer new.
	vis delay: delay.
	MatrixVisualizer on: self withView: vis view.
	vis composer group: #source.
	sourceMarker := (COOSparseMatrixVisualizer new
		getElementShapeScaled: 5)
		elementOn: (COOSparseMatrixNode row: 0 column: 0 value: 0).
	vis add: sourceMarker.
	vis group: #sourceMarker.
	vis composer move: #sourceMarker onTheRightOf: #source.
	vis composer nameGroup: #sourceMarker as: 'sourceMarker'.
	vis composer nameGroup: #source as: 'source'.
	vis composer
		setBackgroundColor: (Color gray alpha: 0.2)
		forGroup: #source.
	vis composer group: #labels.
	vis namedGroups: #(#source #transpositionList #sourceMarker).
	vis backgroundGroups: #(#source #transpositionList).
	operationProcess := [ self isEmpty
		ifFalse: [ marker := first.
			vis selectModel: marker.
			tempList := SortedCollection new
				sortBlock: [ :left :right | 
					left row < right row
						or: [ left row = right row and: [ left column < right column ] ] ].
			[ marker isNotNil ]
				whileTrue: [ (vis composer hasGroup: #transpositionList)
						ifTrue: [ vis composer removeGroup: #transpositionList ].
					tempList
						add:
							(COOSparseMatrixNode
								row: marker column
								column: marker row
								value: marker value).
					COOSparseMatrixVisualizer
						onNodeCollection: tempList
						withView: vis view.
					vis composer group: #transpositionList.
					vis composer move: #transpositionList below: #source.
					vis redrawNamesAndBackgrounds.
					vis composer view canvas focusOnCenterScaled.
					vis delay wait.
					vis deselectModel: marker.
					marker := marker rightNeighbour.
					marker isNotNil
						ifTrue: [ sourceMarker updateModelAndRedraw: marker.
							vis selectModel: marker ]
						ifFalse: [ sourceMarker
								updateModelAndRedraw: (COOSparseMatrixNode row: 0 column: 0 value: 0) ] ].
						(vis composer hasGroup: #transpositionList)
						ifTrue: [ vis composer removeGroup: #transpositionList ].
			tempList reSort.
			COOSparseMatrixVisualizer
				onNodeCollection: tempList
				withView: vis view.
			vis composer group: #transpositionList.
			vis composer move: #transpositionList below: #source.
			vis redrawNamesAndBackgrounds.
			vis delay wait.
			tempList
				keysAndValuesDo: [ :index :element | 
					index - 1 > 0
						ifTrue: [ element leftNeighbour: (tempList at: index - 1).
							(vis composer hasGroup: #transpositionList)
								ifTrue: [ vis composer removeGroup: #transpositionList ].
							COOSparseMatrixVisualizer
								onNodeCollection: tempList
								withView: vis view.
							vis composer group: #transpositionList.
							vis composer move: #transpositionList below: #source.
							vis redrawNamesAndBackgrounds.
							vis delay wait ].
					index < tempList size
						ifTrue: [ element rightNeighbour: (tempList at: index + 1).
							(vis composer hasGroup: #transpositionList)
								ifTrue: [ vis composer removeGroup: #transpositionList ].
							COOSparseMatrixVisualizer
								onNodeCollection: tempList
								withView: vis view.
							vis composer group: #transpositionList.
							vis composer move: #transpositionList below: #source.
							vis redrawNamesAndBackgrounds.
							vis delay wait ] ].
			result first: tempList first.
			result last: tempList last ] ] newProcess.
	vis setUpMenuWithProcess: operationProcess.
	^ vis view