copying
copy
	| result rowMarker marker colMarkers |
	result := self class rows: rowNumber columns: columnNumber.
	colMarkers := result columns copy.
	rows
		do: [ :rowHead | 
			rowMarker := result rows at: rowHead row.
			marker := rowHead.
			[ marker rightNeighbour column ~= 0 ]
				whileTrue: [ rowMarker
						rightNeighbour:
							(TWSparseMatrixNode
								row: marker rightNeighbour row
								column: marker rightNeighbour column
								value: marker rightNeighbour value).
					(colMarkers at: marker rightNeighbour column)
						belowNeighbour: rowMarker rightNeighbour.
					colMarkers
						at: marker rightNeighbour column
						put: rowMarker rightNeighbour.
					rowMarker := rowMarker rightNeighbour.
					marker := marker rightNeighbour ].
			rowMarker rightNeighbour: (result rows at: rowHead row) ].
	colMarkers
		do:
			[ :colMarker | colMarker belowNeighbour: (result columns at: colMarker column) ].
	^ result