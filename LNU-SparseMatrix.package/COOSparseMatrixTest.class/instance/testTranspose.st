tests-transformation
testTranspose
	| transposed |
	transposed := full transpose.
	self assert: (transposed at: 1 at: 1) equals: (full at: 1 at: 1).
	self assert: (transposed at: 1 at: 3) equals: (full at: 3 at: 1).
	self assert: (transposed at: 2 at: 3) equals: (full at: 3 at: 2).
	self assert: (transposed at: 3 at: 2) equals: (full at: 2 at: 3)