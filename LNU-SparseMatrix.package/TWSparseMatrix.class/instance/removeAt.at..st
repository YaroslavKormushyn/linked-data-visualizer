removing
removeAt: row at: column
	| rowMarker colMarker |
	(self existsAt: row at: column)
		ifFalse: [ ^ self ].
	rowMarker := rows at: row.
	colMarker := columns at: column.
	[ rowMarker rightNeighbour column ~= 0 and: [rowMarker rightNeighbour column < column] ]
		whileTrue: [ rowMarker := rowMarker rightNeighbour ].
	(rowMarker rightNeighbour column = column)
		ifTrue: [ rowMarker rightNeighbour: rowMarker rightNeighbour rightNeighbour.
			^ self ].
	[ colMarker belowNeighbour row ~= 0 and: [colMarker belowNeighbour row < row] ]
		whileTrue: [ colMarker := colMarker belowNeighbour ].
	(colMarker belowNeighbour row = row)
		ifTrue: [ colMarker belowNeighbour: colMarker belowNeighbour belowNeighbour].
		^ self