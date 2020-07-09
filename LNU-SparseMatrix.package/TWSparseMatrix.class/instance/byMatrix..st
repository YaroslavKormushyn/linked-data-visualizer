private
byMatrix: aMatrix
	| result rowNumbers columnNumbers lastInRowMarkers lastInColumnMarkers leftMarker rightMarker sum newNode resultUpdateMarker highlightMarker |
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
	lastInRowMarkers := result rows copy.
	lastInColumnMarkers := result columns copy.
	rowNumbers := self rows
		reject: [ :rowHead | rowHead rightNeighbour = rowHead ]
		thenCollect: [ :rowHead | rowHead row ].
	columnNumbers := aMatrix columns
		reject: [ :colHead | colHead belowNeighbour = colHead ]
		thenCollect: [ :colHead | colHead column ].
	rowNumbers
		do: [ :rowIndex | 
			columnNumbers
				do: [ :columnIndex | 
					leftMarker := (self rows at: rowIndex) rightNeighbour.
					rightMarker := (aMatrix columns at: columnIndex) belowNeighbour.
					sum := 0.
					[ leftMarker column ~= 0 and: [ rightMarker row ~= 0 ] ]
						whileTrue: [ leftMarker column < rightMarker row
								ifTrue: [ leftMarker := leftMarker rightNeighbour ]
								ifFalse: [ leftMarker column > rightMarker row
										ifTrue: [ rightMarker := rightMarker belowNeighbour ]
										ifFalse: [ sum := sum + (leftMarker value * rightMarker value).
											highlightMarker := 1.
											rightMarker := rightMarker belowNeighbour.
											leftMarker := leftMarker rightNeighbour ] ] ].
					sum ~= 0
						ifTrue: [ newNode := TWSparseMatrixNode new
								value: sum
								row: rowIndex
								column: columnIndex.
							(lastInRowMarkers at: rowIndex) rightNeighbour: newNode.
							(lastInColumnMarkers at: columnIndex) belowNeighbour: newNode.
							lastInRowMarkers at: rowIndex put: newNode.
							lastInColumnMarkers at: columnIndex put: newNode.
							resultUpdateMarker := 1 ] ] ].
	result rows
		withIndexDo:
			[ :rowHead :rowIndex | (lastInRowMarkers at: rowIndex) rightNeighbour: rowHead ].
	result columns
		withIndexDo:
			[ :colHead :colIndex | (lastInColumnMarkers at: colIndex) belowNeighbour: colHead ].
	^ result