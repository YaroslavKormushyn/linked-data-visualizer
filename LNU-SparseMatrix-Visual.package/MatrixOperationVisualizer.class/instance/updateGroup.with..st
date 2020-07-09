build ui
updateGroup: groupName with: elements
	composer replaceGroup: groupName with: elements.
	composer redrawNamesFor: namedGroups.
	composer redrawBackgroundsFor: backgroundGroups.
	composer view canvas camera focusOnCenter