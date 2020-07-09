tests-arithmetic
testByNumber
	| result |
	result := left * factor.
	self assert: (result at: 1 at: 1) equals: (left at: 1 at: 1) * factor.
	self assert: (result at: 1 at: 3) equals: (left at: 1 at: 3) * factor.
	self assert: (result at: 3 at: 1) equals: (left at: 3 at: 1) * factor.