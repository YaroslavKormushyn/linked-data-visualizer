accessing
display: linkedStructure
	self shouldBeImplemented.
	linkedStructure isNil
		ifTrue: [ ^ self ].
	^ self allSubclasses
		detect: [ :cl | linkedStructure class isKindOf: cl objectType class ]
		ifFound: [ :cl | cl new display: linkedStructure ]
		ifNone: [ self new display: linkedStructure ]