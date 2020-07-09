private
byMatrix: aMatrix
	| result sum |
	(columnNumber = aMatrix rowNumber)
		ifFalse: [ Error signal: 'Invalid matrix sizes' ].
		
	result := self class rows: rowNumber columns: aMatrix columnNumber.
	1 to: result rowNumber do: [ :rowIndex |
		1 to: result columnNumber do: [ :columnIndex |
			sum := (1 to: columnNumber) inject: 0 into: [ :total :k |
				total + 
					((self at: rowIndex at: k) 
					* (aMatrix at: k at: columnIndex )) ].
			result at: rowIndex at: columnIndex put: sum ] ].
	^ result