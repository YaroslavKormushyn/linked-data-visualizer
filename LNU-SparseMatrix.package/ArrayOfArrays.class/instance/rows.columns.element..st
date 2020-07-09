instance creation
rows: rowNum columns: colNum element: aNumber
	rowNumber := rowNum.
	columnNumber := colNum.
	rows := (1 to: rowNumber) collect: [ :index | (Array new: columnNumber) atAllPut: aNumber].