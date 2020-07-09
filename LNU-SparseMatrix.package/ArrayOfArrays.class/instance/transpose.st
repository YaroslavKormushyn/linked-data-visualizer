transformation
transpose
	| result |
	result := self class rows: columnNumber columns: rowNumber.
	result withAll: ((1 to: result rowNumber) collect: [ :rowIndex |
	(1 to: result columnNumber) collect: [ :columnIndex |
		self at: columnIndex at: rowIndex ] ]).
	
	^ result