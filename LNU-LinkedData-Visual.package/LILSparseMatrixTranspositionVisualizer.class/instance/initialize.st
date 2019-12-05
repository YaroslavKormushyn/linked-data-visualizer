initialization
initialize
	super initialize.
	namedGroups := #(#source #result #sourceMarker).
	backgroundGroups := #(#source #result).
	updateMessageDict := {(LILSparseMatrixNode -> {#value:})}
		asDictionary.
		