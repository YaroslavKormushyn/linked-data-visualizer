*LNU-Roassal-Extensions
redrawNamesFor: groupNames
	self removeAllNames.
	groupNames do: [ :name | self nameGroup: name as: name asString ].
	(mapping includesKey: #labels)
		ifTrue: [ self groupToExisting: #labels ]
		ifFalse: [ self group: #labels ]