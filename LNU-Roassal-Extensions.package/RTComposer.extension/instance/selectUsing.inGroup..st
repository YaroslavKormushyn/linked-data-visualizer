*LNU-Roassal-Extensions
selectUsing: aBlock inGroup: groupName
	[ (self getGroup: groupName)
		select: [ :el | 
			[ aBlock value: el model ]
				on: Error
				do: false ]
		thenDo: [ :el | el color: Color red ] ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate