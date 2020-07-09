animations
multiplyAnimated: left by: right
	"remember matrices for reference in links"

	leftMatrix := left.
	rightMatrix := right.
	"process of multiplication"
	process := [ [leftMatrix byMatrix: rightMatrix] ensure: [self unlink] ] newProcess.
	"set initial links to initialize the view"

	"the process runs until all the initialization is done and the view is in its initial state"
	[ self setMultiLinksOn: leftMatrix.
	process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ].
	self setUpMenuWithProcess: process.
	^ composer view