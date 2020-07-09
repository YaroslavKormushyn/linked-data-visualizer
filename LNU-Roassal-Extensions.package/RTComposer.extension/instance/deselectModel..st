*LNU-Roassal-Extensions
deselectModel: model
	[ (view elementFromModel: model) color: Color blue ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate