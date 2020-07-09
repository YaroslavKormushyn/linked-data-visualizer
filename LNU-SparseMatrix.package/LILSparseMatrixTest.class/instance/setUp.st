running
setUp 
	rows := 3.
	columns := 3.
	factor := 2.
	twoByTwo := LILSparseMatrix withAll: { { 1 . 2 } . { 4 . 5 } }.
	empty := LILSparseMatrix rows: rows columns: columns.
	full := LILSparseMatrix withAll: { { 1 . 2 . 3 } . { 4 . 5 . 6 } . { 7 . 8 . 9 } }.
	left := LILSparseMatrix withAll: { { 0 . 0 . 2 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.
	right := LILSparseMatrix withAll: { { 1 . 0 . 0 } . { 2 . 0 . 4 } . { 0 . 1 . 0 } }.	
	leftPlusRight := LILSparseMatrix withAll: { { 1 . 0 . 2 } . { 4 . 0 . 4 } . { 5 . 1 . 0 } }.
	leftByRight := LILSparseMatrix withAll: { { 0 . 2 . 0 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.