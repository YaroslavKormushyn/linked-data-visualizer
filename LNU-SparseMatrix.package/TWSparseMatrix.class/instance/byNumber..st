private
byNumber: aNumber
	| result marker |
	aNumber = 0
		ifTrue: [ ^ self class rows: rowNumber columns: columnNumber ].
	result := self copy.
	result rows
		do: [ :rowHead | 
			marker := rowHead rightNeighbour.
			[ marker ~= rowHead ]
				whileTrue: [ marker value: marker value * aNumber.
					marker := marker rightNeighbour ] ].
	^ result