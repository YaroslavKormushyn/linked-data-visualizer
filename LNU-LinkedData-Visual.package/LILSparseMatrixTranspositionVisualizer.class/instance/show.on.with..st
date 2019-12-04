as yet unclassified
show: operator on: left with: right
	super show: operator on: left with: right.
	[ [ process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ] ]
		newProcess resume.
	^ composer view