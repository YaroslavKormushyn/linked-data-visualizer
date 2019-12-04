accessing
display: linkedStructure
	linkedStructure ifNil: [ ^ self ].
	^ self allSubclasses
		detect: [ :cl | linkedStructure class = cl objectType ]
		ifFound: [ :cl | 
			cl new
				display: linkedStructure ]
		ifNone: [ self allSubclasses
				detect: [ :any | linkedStructure class isKindOf: any ]
				ifFound: [ :any | 
					any new
						display: linkedStructure ]
				ifNone: [ self new
						display: linkedStructure ] ]