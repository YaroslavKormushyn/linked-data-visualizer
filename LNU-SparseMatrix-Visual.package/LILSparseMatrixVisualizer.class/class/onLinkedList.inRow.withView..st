instance creation
onLinkedList: aLinkedList inRow: rowIndex withView: aView
	(aLinkedList isKindOf: LinkedList)
		ifFalse: [ Error signal: 'should be of class ' , LinkedList className ].
	^ (self new withView: aView) onLinkedList: aLinkedList inRow: rowIndex