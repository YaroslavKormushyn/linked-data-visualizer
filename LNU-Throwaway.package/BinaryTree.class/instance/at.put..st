accessing
at: newKey put: value
	children
		detect: [ :kid | kid key = newKey ]
		ifFound: [ :kid | 
			children remove: kid.
			children add: value ]
		ifNone: [ children add: value ].
		children sort: [ :kid | kid key ].
		^ value