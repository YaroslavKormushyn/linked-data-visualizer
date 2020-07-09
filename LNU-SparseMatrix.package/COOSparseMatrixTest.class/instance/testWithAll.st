tests-private
testWithAll
	| result |
	result := COOSparseMatrix withAll: { { 1 . 2 } . { 0 . 1 } }.
	self assert: result columnNumber equals: 2.
	self assert: result rowNumber equals: 2.
	self assert: (result at: 1 at: 1) equals: 1.