running
setUp 
	rows := 3.
	columns := 3.
	factor := 4.
	empty := COOSparseMatrix rows: rows columns: columns.
	twoByTwo := COOSparseMatrix withAll: { { 1 . 2 } . { 4 . 5 } }.
	full := COOSparseMatrix withAll: { { 1 . 2 . 3 } . { 4 . 5 . 6 } . { 7 . 8 . 9 } }.
	left := COOSparseMatrix withAll: { { 0 . 0 . 2 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.
	right := COOSparseMatrix withAll: { { 1 . 0 . 0 } . { 2 . 0 . 4 } . { 0 . 1 . 0 } }.
	leftPlusRight := COOSparseMatrix withAll: { { 1 . 0 . 2 } . { 4 . 0 . 4 } . { 5 . 1 . 0 } }.
	leftByRight := COOSparseMatrix withAll: { { 0 . 2 . 0 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.