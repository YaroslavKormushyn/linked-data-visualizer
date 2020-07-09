*LNU-Roassal-Extensions
selectModel: model inGroup: group
	[ ((self getGroup: group) elementFromModel: model)
		color: Color red ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate