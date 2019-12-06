initialization
initialize
	super initialize.
	linkMessages := #(#next) asSet.
	gap := 10.
	 shapes
		at: #tempListLabel
		put: (RTLabel new text: [ :val | 'New ' , val asString , ' row:' ])