build ui
updateRowWith: linkedList rowIndex: index
	composer replaceElementsInGroup: #tempList with: linkedList.
	composer move: #tempList onTheRightOf: #tempListLabel.
	composer redrawNamesFor: namedGroups.
	composer redrawBackgroundsFor: backgroundGroups.
	composer view canvas focusOnCenterScaled