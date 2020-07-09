*LNU-Roassal-Extensions
redrawBackgroundsFor: groupNames
	self removeAllBackgrounds.
	groupNames
		do:
			[ :name | self setBackgroundColor: (Color gray alpha: 0.2) forGroup: name ].
		(mapping includesKey: #labels)
		ifTrue: [ self groupToExisting: #labels ]
		ifFalse: [ self group: #labels ]
	