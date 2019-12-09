as yet unclassified
show: operator on: operand
	super show: operator on: operand.
	scale := (operands at: #source) columnNumber.
	sourceMarkerElement := (LILSparseMatrixVisualizer new
		getElementShapeScaled: scale)
		elementOn: (MatrixElement row: 0 column: 0 value: 0).
	tempListLabelElement := ((dataVisualizers at: #source) shapes
		at: #tempListLabel) elementOn: 0.
	[ [ process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ] ]
		newProcess resume.
	^ composer view