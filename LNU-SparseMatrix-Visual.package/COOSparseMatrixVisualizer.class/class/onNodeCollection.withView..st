instance creation
onNodeCollection: aCollection withView: aView
	(aCollection isKindOf: Collection)
		ifFalse: [ Error
				signal: 'Not a collection' ].
	^ (self new withView: aView) onCollection: aCollection