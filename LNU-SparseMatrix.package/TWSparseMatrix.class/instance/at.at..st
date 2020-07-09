accessing
at: rowNumber at: columnNumber
	| rowMarker colMarker |
	rowMarker := rows at: rowNumber.
	colMarker := columns at: columnNumber.
	[ (rowMarker rightNeighbour column ~= 0 ) & (rowMarker rightNeighbour column < columnNumber) ]
		whileTrue: [ rowMarker := rowMarker rightNeighbour ].
	rowMarker rightNeighbour column = columnNumber
		ifTrue: [ ^ rowMarker rightNeighbour value].
	^ 0.
	
 	"[ colMarker belowNeighbour isNotNil & (colMarker belowNeighbour row < rowNumber) ]
		whileTrue: [ colMarker := colMarker belowNeighbour ].
	colMarker belowNeighbour row = rowNumber
		ifTrue: [ ^ colMarker belowNeighbour value]"