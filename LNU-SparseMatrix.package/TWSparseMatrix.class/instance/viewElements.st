private
viewElements
	| result marker |
	result := rows asOrderedCollection.
	result addAll: columns.
	self isEmpty
		ifFalse: [ 1 to: rows size
				do: [ :rowInd | 
					marker := (rows at: rowInd) rightNeighbour.
					[ marker isNotNil and: [ marker column ~= 0 ] ]
						whileTrue: [ result add: marker.
							marker := marker rightNeighbour ] ] ].
	^ result