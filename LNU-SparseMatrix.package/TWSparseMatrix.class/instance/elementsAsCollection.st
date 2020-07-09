private
elementsAsCollection
	| result marker |
	self isEmpty
		ifTrue: [ result := rows asOrderedCollection.
			result addAll: columns ]
		ifFalse: [ result := rows asOrderedCollection.
			result addAll: columns.
			1 to: rows size do: [ :rowInd | 
				marker := (rows at: rowInd) rightNeighbour.
				[ marker isNotNil and: [marker column ~= 0] ]
					whileTrue: [ result add: marker.
						marker := marker rightNeighbour ] ] ].
	^ result