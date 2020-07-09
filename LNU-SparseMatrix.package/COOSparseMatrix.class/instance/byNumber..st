private
byNumber: aNumber
	| result marker |
	aNumber = 0
		ifTrue: [ ^ self class class rows: rowNumber columns: rowNumber ].
	
	result := self copy.
	marker := result first.
	[ marker isNotNil ]
		whileTrue:
		[ marker value: (marker value * aNumber).
		  marker := marker rightNeighbour ].
	
	^ result