*LNU-Roassal-Extensions
highlightModel: model
	[ (view elementFromModel: model)
		color: Color yellow ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate