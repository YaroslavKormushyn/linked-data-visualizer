*LNU-Roassal-Extensions
deselectUsing: aBlock
	"deselect all elements for which models aBlock answers true"

	[ view elements
		select: [ :el | 
			[ aBlock value: el model ]
				on: Error
				do: false ]
		thenDo: [ :el | el color: Color blue ] ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate