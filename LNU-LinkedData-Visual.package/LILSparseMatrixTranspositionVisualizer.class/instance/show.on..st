as yet unclassified
show: operator on: operand
	super show: operator on: operand.
	[ [ process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ] ]
		newProcess resume.
	^ composer view