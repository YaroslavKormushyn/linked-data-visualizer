build ui
updateRowWith: linkedList rowIndex: index
	composer replaceElementsInGroup: #tempList with: linkedList.
	tempListLabelElement model: index.
	tempListLabelElement update.
	composer move: #tempListLabel above: #source.
	composer move: #tempList onTheRightOf: #tempListLabel.
	composer redrawNamesFor: namedGroups.
	composer redrawBackgroundsFor: backgroundGroups.
	composer view canvas focusOnCenterScaled