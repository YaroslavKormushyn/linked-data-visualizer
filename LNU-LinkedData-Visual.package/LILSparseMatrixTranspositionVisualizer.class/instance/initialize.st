initialization
initialize
	super initialize.
	currentRowIndex := 0.
	currentColumnIndex := 0.
	namedGroups := #(#source #result #sourceMarker).
	backgroundGroups := #(#source #result).
	updateMessageDict := {(LILSparseMatrixNode -> {#value:})}
		asDictionary.
	delay := Delay forSeconds: 1