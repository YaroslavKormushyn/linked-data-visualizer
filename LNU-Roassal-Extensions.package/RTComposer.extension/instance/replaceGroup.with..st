*LNU-Roassal-Extensions
replaceGroup: groupName with: elements
	self removeGroup: groupName.
	self view addAll: elements.
	self group: groupName.
	self view signalUpdate