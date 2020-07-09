instance creation
onLinkedList: aLinkedList withView: aView
	(aLinkedList isKindOf:  LinkedList)
		ifFalse: [ Error
				signal: 'should be of class ' , LinkedList className ].
	^ (self new withView: aView) onLinkedList: aLinkedList 