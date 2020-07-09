*LNU-Roassal-Extensions
deselectModels: modelCollection
	modelCollection
		do: [ :model | 
			[ (self view elementFromModel: model) color: Color blue ]
				on: Error
				do: [ :exception | nil ] ].
	self view signalUpdate