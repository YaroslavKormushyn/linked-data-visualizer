example
example
	"An example of creating a visualizer on a matrix"

	| mat vis |
	mat := COOSparseMatrix
		withAll:
			{{1 . 2 . 0}.
			{1 . 0 . 2}.
			{0 . 0 . 5}}.
	vis := self on: mat.
	^ vis open