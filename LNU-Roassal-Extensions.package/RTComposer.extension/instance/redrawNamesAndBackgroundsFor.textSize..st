*LNU-Roassal-Extensions
redrawNamesAndBackgroundsFor: groupNames textSize: height
	self
		removeAllBackgrounds;
		removeAllNames.
	groupNames
		do: [ :name | 
			self setBackgroundColor: (Color gray alpha: 0.2) forGroup: name.
			self nameGroup: name as: name asString sized: height ]