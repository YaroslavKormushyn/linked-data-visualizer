accessing
display: linkedStructure withView: newView
	linkedStructure isNil
		ifTrue: [ ^ self ].
	^ self allSubclasses
		detect: [ :cl | linkedStructure class isKindOf: cl objectType class ]
		ifFound: [ :cl | 
			cl
				withView: newView;
				display: linkedStructure ]
		ifNone: [ self
				withView: newView;
				display: linkedStructure ]