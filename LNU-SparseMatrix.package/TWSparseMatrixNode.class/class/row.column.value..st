instance creation
row: rowNumber column: columnNumber value: aValue
	rowNumber isInteger & columnNumber isInteger
		ifFalse: [ Error signal: 'Row and column indices must be integer values' ].
	(rowNumber > 0 and: [ columnNumber > 0 ] )
		ifFalse: [ DomainError signal: 'Indices must be a positive value' from: 1 ].
	^ self new value: aValue row: rowNumber column: columnNumber