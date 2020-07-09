tests-instance creation
testWithAll
	| matrix |
	matrix := LILSparseMatrix withAll: { { 0 . 0 } . { 1 . 2 } }.
	self assert: (matrix rowNumber) equals: 2.
	self assert: (matrix columnNumber) equals: 2.
	self assert: (matrix at: 1 at: 1) equals: 0.
	self assert: (matrix at: 2 at: 1) equals: 1