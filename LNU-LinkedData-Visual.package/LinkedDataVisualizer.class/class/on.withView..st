accessing
on: linkedStructure withView: newView
	linkedStructure ifNil: [ ^ self new ].
	^ self allSubclasses
		detect: [ :cl | linkedStructure class = cl objectType or: [ (linkedStructure class name findString: 'subclass of ', cl objectType name) ~= 0 ] ]
		ifFound: [ :cl | (cl withView: newView) on: linkedStructure ]
		ifNone: [ self allSubclasses
				detect: [ :any | linkedStructure class isKindOf: any ]
				ifFound:
					[ :any | (any withView: newView) on: linkedStructure ]
				ifNone: [ (self withView: newView) on: linkedStructure ] ]