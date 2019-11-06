build ui
updateResultWith: result
	composer replaceElementsInGroup: #result with: result.
	composer move: #result onTheRightOf: #right.
	composer redrawNamesFor: namedGroups.
	composer redrawBackgroundsFor: backgroundGroups.
	composer view canvas focusOnCenterScaled