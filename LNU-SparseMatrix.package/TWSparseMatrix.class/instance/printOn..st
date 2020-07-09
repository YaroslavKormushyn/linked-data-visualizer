printing
printOn: aStream
	aStream nextPut: $(.
	1 to: self rowsNumber do: [ :rowIndex | 
		(1 to: self columnsNumber) do: [ :colIndex | aStream print: (self at: rowIndex at: colIndex) ] separatedBy: [ aStream space ].
		aStream cr ].
	aStream nextPut: $)