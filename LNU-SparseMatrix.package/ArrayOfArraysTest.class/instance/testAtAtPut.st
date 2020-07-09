tests-accessing
testAtAtPut
	self assert: (full at: 1 at: 1) equals: 1.
	full at: 1 at: 1 put: 2.
	self assert: (full at: 1 at: 1) equals: 2.
	full at: 1 at: 1 put: 0.
	self assert: (full at: 1 at: 1) equals: 0.
	self should: [ full at: rows + 1 at: columns + 1 put: 1 ] raise: SubscriptOutOfBounds