as yet unclassified
show: operator on: left with: right
	| defaultLabelHeight |
	defaultLabelHeight := TRLabelShape defaultFontSize.
	super show: operator on: left with: right.
	scale := (operands at: #left) columnNumber / 1.5.
	composer gap: scale * defaultLabelHeight * 1.5.
	leftMarkerElement := (dataVisualizers at: #left)
		getDefaultDataElementShape
		elementOn: (TWSparseMatrixNode new value: nil row: 0 column: 0).
	rightMarkerElement := (dataVisualizers at: #right)
		getDefaultDataElementShape
		elementOn: (TWSparseMatrixNode new value: nil row: 0 column: 0).
	nowProcessingLabel := (RTLabel
		text: [ :point | 'Now processing: ' , point asString ])
		height: defaultLabelHeight * scale.
	newElementValueLabel := (RTLabel
		text: [ :val | 'New element value: ' , val asString ])
		height: defaultLabelHeight * scale.
	nowProcessingLabelElement := nowProcessingLabel elementOn: 0 @ 0.
	newElementValueLabelElement := newElementValueLabel elementOn: 0.
	currentColIndex := 0.
	currentRowIndex := 0.
	[ [ process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ] ]
		newProcess resume.
	^ composer view