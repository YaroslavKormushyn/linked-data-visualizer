accessing
at: rowIndex at: columnIndex put: aValue
	(self validAt: rowIndex at: columnIndex )
			ifFalse: [ SubscriptOutOfBounds signal: 'Indices must be of valid range.' ].
	
	^ (rows at: rowIndex) at: columnIndex put: aValue