as yet unclassified
show: operator on: left with: right
super show: operator on: left with: right.
[ self setLinks.
	process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ].
	self setUpMenu.
	^ composer view