tests-private
testByNumber
	| result |
	result := full * factor.
	self assert: (result at: 1 at: 1) equals: (full at: 1 at: 1) * factor.
	self assert: (result at: 2 at: 2) equals: (full at: 2 at: 2) * factor.
	self assert: (result at: 3 at: 2) equals: (full at: 3 at: 2) * factor