*LNU-Roassal-Extensions
selectModel: model
	[ (view elementFromModel: model) color: Color red ]
		on: Error
		do: [ :exception | 
			nil.].
	self view signalUpdate