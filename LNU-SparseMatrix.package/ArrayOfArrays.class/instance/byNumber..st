private
byNumber: aNumber
	| result |
	
	result := self class rows: rowNumber columns: columnNumber.
	aNumber = 0
		ifTrue: [ ^ result ].
		
	1 to: rowNumber do: [ :rowIndex |
	 	1 to: columnNumber do: [ :columnIndex |
			 result 
				at: rowIndex 
				at: columnIndex 
				put: (self at: rowIndex at: columnIndex) * aNumber ]].
	^ result