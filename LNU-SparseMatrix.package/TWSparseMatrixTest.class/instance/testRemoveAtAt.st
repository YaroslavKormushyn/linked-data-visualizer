tests-removal
testRemoveAtAt
	self assert: (full at: 1 at: 1) equals: 1.
	full removeAt: 1 at: 1.
	self assert: (full at: 1 at: 1) equals: 0