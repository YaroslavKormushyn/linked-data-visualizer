example
example
	| lil |
	lil := LILSparseMatrix
		withAll:
			{{1 . -1 . 0 . 0}.
			{0 . 3 . 0 . 0}.
			{1 . 0 . 2 . 1}.
			{0 . 0 . 0 . 0}}.
	^ self show: #transpose on: lil