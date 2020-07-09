instance creation
rows: rowNum columns: colNum
	rowNumber := rowNum.
	columnNumber := colNum.
	rows := (1 to: rowNumber) collect: [ :index | Array new: columnNumber ]