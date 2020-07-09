tests-accessing
testAddition
	| result |
	result := left + right.
	self assert: (result at: 1 at: 1) equals: (leftPlusRight at: 1 at: 1).
	self assert: (result at: 2 at: 1) equals: (leftPlusRight at: 2 at: 1)