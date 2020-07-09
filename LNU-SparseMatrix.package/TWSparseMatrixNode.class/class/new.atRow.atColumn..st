instance creation
new: aValue atRow: rowNumber atColumn: columnNumber
	rowNumber isInteger & columnNumber isInteger
		ifFalse: [ Error signal: 'Row and column indices must be integer values' ].
	(rowNumber > 0 & columnNumber > 0)
		ifFalse: [ DomainError signal: 'Indices must be a positive value' from: 1 ].
	^ self new value: aValue row: rowNumber column: columnNumber