accessing
display: linkedStructure withView: newView
	linkedStructure ifNil: [ ^ self ].
	^ self allSubclasses
		detect: [ :cl | linkedStructure class = cl objectType class ]
		ifFound: [ :cl | 
			cl
				withView: newView;
				display: linkedStructure ]
		ifNone: [ 
			self allSubclasses detect: [:any | linkedStructure class isKindOf: any]
			ifFound: [ :any | any
				withView: newView;
				display: linkedStructure ] ifNone: [ self
				withView: newView;
				display: linkedStructure ]
			 ]