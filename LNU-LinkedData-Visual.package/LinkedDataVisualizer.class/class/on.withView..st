accessing
on: linkedStructure withView: newView
	linkedStructure isNil
		ifTrue: [ ^ self ].
	^ self allSubclasses
		detect: [ :cl | linkedStructure class isKindOf: cl objectType class ]
		ifFound: [ :cl | 
			(cl
				withView: newView)
				on: linkedStructure ]
		ifNone: [ (self
				withView: newView)
				on: linkedStructure ]