tests-as yet unclassified
testCopy
	| copy |
	copy := left copy.
	self assert: (left at: 3 at: 2) equals: (copy at: 3 at: 2).
	self assert: (left at: 1 at: 2) equals: (copy at: 1 at: 2).
	self assert: (left at: 2 at: 1) equals: (copy at: 2 at: 1).
	self deny: (left first) == (copy first).
	self deny: (left last) == (copy last).