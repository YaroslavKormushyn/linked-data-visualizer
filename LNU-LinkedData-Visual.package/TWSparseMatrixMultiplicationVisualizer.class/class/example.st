example
example
	| coo coo2 |
	coo := TWSparseMatrix
		withAll:
			{{1 . -1 . 0 . 0}.
			{0 . 3 . 0 . 0}.
			{1 . 0 . 2 . 1}.
			{0 . 0 . 0 . 0}}.
	coo2 := TWSparseMatrix
		withAll:
			{{1 . 0 . 0 . 3}.
			{0 . 0 . 0 . -1}.
			{0 . 0 . 0 . 0}.
			{0 . 0 . 1 . 0}}.
	^ self show: #byMatrix: on: coo with: coo2