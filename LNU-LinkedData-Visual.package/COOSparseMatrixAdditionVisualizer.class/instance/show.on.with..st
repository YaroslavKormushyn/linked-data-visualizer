as yet unclassified
show: operator on: left with: right
	| defaultLabelHeight |
	defaultLabelHeight := TRLabelShape defaultFontSize.
	super show: operator on: left with: right.
	scale := (operands at: #left) columnNumber.
	composer gap: scale * defaultLabelHeight * 1.5.
	[ [ process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ] ]
		newProcess resume.
	^ composer view