as yet unclassified
updateLeft
	composer replaceElementsInGroup: #left with: (operands at: #left).
	composer move: #left onTheLeftOf: #right.
	composer redrawNamesFor: namedGroups.
	composer redrawBackgroundsFor: backgroundGroups.
	composer view canvas focusOnCenterScaled