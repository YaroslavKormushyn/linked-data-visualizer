tests
testAddition
	| result |
	result := left + right.
	self assert: (result at: 1 at: 1) equals: (leftPlusRight at: 1 at: 1).
	self assert: (result at: 1 at: 2) equals: (leftPlusRight at: 1 at: 2).
	self assert: (result at: 1 at: 3) equals: (leftPlusRight at: 1 at: 3).
	self assert: (result at: 2 at: 1) equals: (leftPlusRight at: 2 at: 1).
	self assert: (result at: 2 at: 2) equals: (leftPlusRight at: 2 at: 2).
	self assert: (result at: 2 at: 3) equals: (leftPlusRight at: 2 at: 3).
	self assert: (result at: 3 at: 1) equals: (leftPlusRight at: 3 at: 1).
	self assert: (result at: 3 at: 2) equals: (leftPlusRight at: 3 at: 2).
	self assert: (result at: 3 at: 3) equals: (leftPlusRight at: 3 at: 3)