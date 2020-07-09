arithmetic
+ aMatrix
	| result |
	(rowNumber = aMatrix rowNumber) & (columnNumber = aMatrix columnNumber)
		ifFalse: [ Error signal: 'Matrices must be of the same size.' ].
	
	result := self class rows: rowNumber columns: columnNumber.
	1 to: result rowNumber do: [ :rowIndex |
		1 to: result columnNumber do: [ :columnIndex |
			result at: rowIndex at: columnIndex put: 
				( self at: rowIndex at: columnIndex )
				+ (aMatrix at: rowIndex at: columnIndex) ] ].
	^ result