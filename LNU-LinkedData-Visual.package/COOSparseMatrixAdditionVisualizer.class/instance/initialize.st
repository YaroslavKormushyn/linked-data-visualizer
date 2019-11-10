initialization
initialize
	super initialize.
	namedGroups := #(#left #result #right #leftMarker #rightMarker).
	backgroundGroups := #(#left #result #right).
	updateMessageDict := {(COOSparseMatrixNode -> {#value:})} asDictionary