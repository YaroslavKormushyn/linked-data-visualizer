instance creation
rows: rowNum columns: colNum
	rows := (1 to: rowNum) collect: [ :each | LinkedList new ].
	rowNumber := rowNum.
	columnNumber := colNum.
	^ self