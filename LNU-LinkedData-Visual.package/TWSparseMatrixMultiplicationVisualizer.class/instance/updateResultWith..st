build ui
updateResultWith: result
	| defaultLabelHeight |
	defaultLabelHeight := TRLabelShape defaultFontSize.
	composer replaceElementsInGroup: #result with: result.
	composer move: #result onTheRightOf: #right.
	composer
		redrawNamesFor: namedGroups
		textSize: scale * defaultLabelHeight.
	composer redrawBackgroundsFor: backgroundGroups.
	composer view canvas camera focusOnCenterScaled