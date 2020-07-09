accessing
at: rowNumber at: columnNumber put: aValue
	| rowMarker colMarker newNode |
	"if the indices are invalid"
	(aValue = 0 & (self existsAt: rowNumber at: columnNumber ) not) | (rowNumber = 0) | (columnNumber = 0)
		ifTrue: [ ^ self ].
	rowMarker := rows at: rowNumber.
	colMarker := columns at: columnNumber.
	"find elements pointing to the desired element"
	[ rowMarker rightNeighbour column ~= 0 and: [ rowMarker rightNeighbour column < columnNumber ] ] whileTrue: [ rowMarker := rowMarker rightNeighbour ].
	[ colMarker belowNeighbour row ~= 0 and: [ colMarker belowNeighbour row < rowNumber ] ] whileTrue: [ colMarker := colMarker belowNeighbour ].
	"if the element exists - erase it or update its value, otherwise - insert a new element"
	rowMarker rightNeighbour column = columnNumber
		ifTrue: [ colMarker belowNeighbour row = rowNumber
				ifTrue: [ aValue = 0
						ifTrue: [ rowMarker rightNeighbour: rowMarker rightNeighbour rightNeighbour.
							colMarker belowNeighbour: colMarker belowNeighbour belowNeighbour ]
						ifFalse: [ colMarker belowNeighbour value: aValue ] ] ]
		ifFalse: [ aValue ~= 0
				ifTrue: [ newNode := TWSparseMatrixNode row: rowNumber column: columnNumber value: aValue.
					newNode rightNeighbour: rowMarker rightNeighbour belowNeighbour: colMarker belowNeighbour.
					rowMarker rightNeighbour: newNode.
					colMarker belowNeighbour: newNode ] ].
	^ self