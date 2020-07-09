*LNU-Roassal-Extensions
selectUsing: aBlock
	[ view elements
		select: [ :el | 
			[ aBlock value: el model ]
				on: Error
				do: false ]
			thenDo: [ :el | el color: Color red ] ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate