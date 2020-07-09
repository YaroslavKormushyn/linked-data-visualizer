accessing
existsAt: rowIndex at: columnIndex
	| rowMarker |
	rowMarker := rows at: rowIndex.
	[ rowMarker rightNeighbour column ~= 0 and: [ rowMarker rightNeighbour column < columnIndex ] ] whileTrue: [ rowMarker := rowMarker rightNeighbour ].
	^ rowMarker rightNeighbour column = columnIndex