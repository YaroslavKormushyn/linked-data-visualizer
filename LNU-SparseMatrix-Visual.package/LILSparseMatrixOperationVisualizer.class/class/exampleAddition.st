as yet unclassified
exampleAddition
	| col col2 coo coo2 |
	col := {{1 . -1 . 0 . 0}.
	{0 . 3 . 0 . 0}.
	{1 . 0 . 2 . 1}.
	{0 . 0 . 0 . 0}}.
	col2 := {{1 . 0 . 0 . 3}.
	{0 . 0 . 0 . -1}.
	{0 . 0 . 0 . 0}.
	{0 . 0 . 1 . 0}}.
	coo := LILSparseMatrix withAll: col.
	coo2 := LILSparseMatrix withAll: col2.
	^ coo addAnimated: coo2 delay: 1