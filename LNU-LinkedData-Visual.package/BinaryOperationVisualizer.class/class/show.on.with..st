as yet unclassified
show: op on: left with: right
	self subclasses
		detect: [ :cl | cl canVisualize: op ]
		ifFound: [ :cl | ^ cl show: op on: left with: right ]