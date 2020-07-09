running
setUp 
	rows := 3.
	columns := 3.
	factor := 4.
	empty := ArrayOfArrays rows: rows columns: columns.
	twoByTwo := ArrayOfArrays withAll: { { 1 . 2 } . { 4 . 5 } }.
	full := ArrayOfArrays withAll: { { 1 . 2 . 3 } . { 4 . 5 . 6 } . { 7 . 8 . 9 } }.
	left := ArrayOfArrays withAll: { { 0 . 0 . 2 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.
	right := ArrayOfArrays withAll: { { 1 . 0 . 0 } . { 2 . 0 . 4 } . { 0 . 1 . 0 } }.
	leftPlusRight := ArrayOfArrays withAll: { { 1 . 0 . 2 } . { 4 . 0 . 4 } . { 5 . 1 . 0 } }.
	leftByRight := ArrayOfArrays withAll: { { 0 . 2 . 0 } . { 2 . 0 . 0 } . { 5 . 0 . 0 } }.