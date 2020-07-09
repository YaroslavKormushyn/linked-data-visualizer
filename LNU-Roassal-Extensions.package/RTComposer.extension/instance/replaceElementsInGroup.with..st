*LNU-Roassal-Extensions
replaceElementsInGroup: groupName with: structure
	self removeGroup: groupName.
	LinkedDataVisualizer on: structure withView: view.
	self group: groupName.
	self view signalUpdate