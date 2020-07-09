as yet unclassified
at: rowIndex at: columnIndex
	| index |
	(self validAt: rowIndex at: columnIndex )
		ifFalse: [ SubscriptOutOfBounds signal: 'Indices must be of valid range.' ].
	
	index := (rows at: rowIndex) isEmpty 
				ifTrue: [ ^ 0 ]
				ifFalse: [ 
					(rows at: rowIndex)
						findFirst: [ :link | link column = columnIndex ]].
	
	index = 0
		ifFalse: [ ^ ((rows at: rowIndex) at: index) value].
	^ 0