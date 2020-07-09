*LNU-Roassal-Extensions
highlightUsing: aBlock inGroup: groupName
	[ (self getGroup: groupName)
		select: [ :el | 
			[ aBlock value: el model ]
				on: Error
				do: false ]
		thenDo: [ :el | el color: Color yellow ] ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate