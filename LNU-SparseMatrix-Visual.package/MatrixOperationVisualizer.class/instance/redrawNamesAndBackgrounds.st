as yet unclassified
redrawNamesAndBackgrounds
(	namedGroups isNil or: [ backgroundGroups isNil ]) ifTrue: [ 
		Error signal: 'Empty group' ].
	composer redrawBackgroundsFor: backgroundGroups.
	composer redrawNamesFor: namedGroups 