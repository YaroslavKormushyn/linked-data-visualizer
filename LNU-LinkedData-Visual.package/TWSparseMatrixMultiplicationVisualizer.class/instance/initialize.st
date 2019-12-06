initialization
initialize
	super initialize.
	namedGroups := #(#left #result #right #leftMarker #rightMarker).
	backgroundGroups := #(#left #result #right).
	updateMessageDict := {(TWSparseMatrixNode -> {#value:})} asDictionary.
	delay := Delay forSeconds: 0.5.