instance creation
rows: numberOfRows columns: numberOfColumns
	rowNumber := numberOfRows.
	columnNumber := numberOfColumns.
	rows := (1 to: numberOfRows)
		collect: [ :each | TWSparseMatrixNode new value: nil row: each column: 0 ].
	columns := (1 to: numberOfColumns)
		collect: [ :each | TWSparseMatrixNode new value: nil row: 0 column: each ].
	rows := rows
		collect: [ :each | each rightNeighbour: each belowNeighbour: nil ].
	columns := columns
		collect: [ :each | each rightNeighbour: nil belowNeighbour: each ]