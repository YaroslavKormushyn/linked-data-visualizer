tests-accessing
testAtAt
	self assert: (full at: 1 at: 1) equals: 1.
	self assert: (full at: 3 at: 2) equals: 8.
	self assert: (left at: 3 at: 2) equals: 0.
	self should: [ left at: rows + 1 at: 3 ] raise: SubscriptOutOfBounds