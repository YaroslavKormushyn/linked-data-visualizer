as yet unclassified
exampleTransposition
	| col coo cooanimvis |
	col := {{1 . -1 . 0 . 0}.
	{0 . 3 . 0 . 0}.
	{1 . 0 . 2 . 1}.
	{0 . 0 . 0 . 0}}.
	coo := TWSparseMatrix withAll: col.
	cooanimvis := TWSparseMatrixOperationVisualizer new.
	cooanimvis delay: 1.
	^ coo transposeAnimatedDelay: 1