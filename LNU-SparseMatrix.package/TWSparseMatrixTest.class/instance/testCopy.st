tests-copying
testCopy
	| copy |
	copy := left copy.
	self assert: (copy at: 3 at: 1) equals: (left at: 3 at: 1).
	self assert: (left at: 3 at: 2) equals: (copy at: 3 at: 2).
	self assert: (left at: 1 at: 2) equals: (copy at: 1 at: 2).
	self assert: (left at: 2 at: 1) equals: (copy at: 2 at: 1).
	copy := copy * factor.
	self assert: (copy at: 3 at: 1) equals: (left at: 3 at: 1) * factor.