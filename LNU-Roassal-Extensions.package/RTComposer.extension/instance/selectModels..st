*LNU-Roassal-Extensions
selectModels: modelCollection
	modelCollection do: [ :model | 
		[ (self view elementFromModel: model) color: Color red ]
		on: Error
		do: [ :exception | nil ]]. 
	self view signalUpdate