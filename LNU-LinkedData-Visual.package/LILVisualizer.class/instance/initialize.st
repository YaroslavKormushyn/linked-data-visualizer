initialization
initialize
	super initialize.
	linkMessages := #(#next) asSet.
	shapes
		at: #tempListLabel
		put: (RTLabel new text: [ :val | 'New ' , val asString , ' row:' ])