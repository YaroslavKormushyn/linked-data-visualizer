initialization
setUp 
	rows := 3.
	columns := 3.
	factor := 2.
	twoByTwo := TWSparseMatrix withAll: { { 1 . 2 } . { 4 . 5 } }.
	empty := TWSparseMatrix rows: rows columns: columns.
	full := TWSparseMatrix withAll: { { 1 . 2 . 3 } . { 4 . 5 . 6 } . { 7 . 8 . 9 } }.
	left := TWSparseMatrix withAll: { { 0 . 0 . 2 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.
	right := TWSparseMatrix withAll: { { 1 . 0 . 0 } . { 2 . 0 . 4 } . { 0 . 1 . 0 } }.	
	leftPlusRight := TWSparseMatrix withAll: { { 1 . 0 . 2 } . { 4 . 0 . 4 } . { 5 . 1 . 0 } }.
	leftByRight := TWSparseMatrix withAll: { { 0 . 2 . 0 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.