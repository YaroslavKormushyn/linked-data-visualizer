*LNU-Roassal-Extensions
deselectModel: model inGroup: group
	[ ((self getGroup: group) elementFromModel: model) color: Color blue ]
		on: Error
		do: [ :exception | nil ].
	self view signalUpdate