*LNU-Roassal-Extensions
highlightModels: modelCollection
	modelCollection
		do: [ :model | 
			[ (view elementFromModel: model) color: Color yellow ]
				on: Error
				do: [ :exception | nil ] ].
	self view signalUpdate