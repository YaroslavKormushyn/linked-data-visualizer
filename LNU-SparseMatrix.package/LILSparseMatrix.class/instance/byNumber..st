private
byNumber: aNumber
	| result |
	aNumber = 0
		ifTrue: [ ^ self class rows: rowNumber columns: columnNumber ].
	
	result := self copy.
	result rows do: [ :list | list do: [ :node | node value: (node value * aNumber) ] ].
	^ result