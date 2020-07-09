tests-arithmetic
testByMatrix
	| result |
	result := left * right.
	self assert: (result at: 1 at: 1) equals: (leftByRight at: 1 at: 1).
	self assert: (result at: 1 at: 2) equals: (leftByRight at: 1 at: 2).
	self should: [ twoByTwo * left ] raise: Error