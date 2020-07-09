*LNU-Roassal-Extensions
redrawNamesFor: groupNames textSize: height
	self removeAllNames.
	groupNames do: [ :name | self nameGroup: name as: name asString sized: height].
	(mapping includesKey: #labels)
		ifTrue: [ self groupToExisting: #labels ]
		ifFalse: [ self group: #labels ]