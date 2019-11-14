as yet unclassified
getElementsFor: linkedStructure
	|elements|
	elements := linkedStructure children.
	elements addFirst: linkedStructure.
	