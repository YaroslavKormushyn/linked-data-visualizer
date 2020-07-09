as yet unclassified
exampleMultiplication
	| col coo |
	col := {{1 . -1 . 0 . 0}.
	{0 . 3 . 0 . 0}.
	{1 . 0 . 2 . 1}.
	{0 . 0 . 0 . 0}}.
	coo := TWSparseMatrix withAll: col.
	^ coo byMatrixAnimated: coo delay: 1