transformation
transpose
	| copy rowMarker result columnMarkers |
	result := self class rows: columnNumber columns: rowNumber.
	self isEmpty
		ifTrue: [ ^ result ].
	columnMarkers := result columns copy.
	result rows
		withIndexDo: [ :each :rowIndex | 
			copy := self columns at: rowIndex.
			rowMarker := each.
			[ copy belowNeighbour row ~= 0 ]
				whileTrue: [ copy := copy belowNeighbour.
					rowMarker
						rightNeighbour:
							(TWSparseMatrixNode new
								value: copy value
								row: copy column
								column: copy row).
					(columnMarkers at: copy row)
						belowNeighbour: rowMarker rightNeighbour.
					columnMarkers at: copy row put: rowMarker rightNeighbour.
					rowMarker := rowMarker rightNeighbour ].
			rowMarker rightNeighbour: each ].
	result columns
		withIndexDo:
			[ :each :columnIndex | (columnMarkers at: columnIndex) belowNeighbour: each ].
	^ result