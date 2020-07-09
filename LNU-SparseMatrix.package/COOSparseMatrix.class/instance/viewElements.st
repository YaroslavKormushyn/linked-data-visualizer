utility
viewElements
	| marker result |
	self isEmpty
		ifTrue: [ ^ OrderedCollection new: 0 ].
	marker := self first.
	result := OrderedCollection new.
	[ marker isNotNil ]
		whileTrue: [ result add: marker.
			marker := marker rightNeighbour ].
	^ result