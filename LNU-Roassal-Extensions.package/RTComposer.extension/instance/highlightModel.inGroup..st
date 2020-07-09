*LNU-Roassal-Extensions
highlightModel: model inGroup: group
	[ ((self getGroup: group) elementFromModel: model) color: Color yellow ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate