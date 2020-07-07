build ui
updateResultWith: result
	composer replaceElementsInGroup: #result with: result.
	composer move: #result onTheRightOf: #source.
	composer redrawNamesFor: namedGroups.
	composer redrawBackgroundsFor: backgroundGroups.
	composer view canvas camera focusOnCenterScaled