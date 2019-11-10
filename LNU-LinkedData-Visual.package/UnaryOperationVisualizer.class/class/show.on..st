as yet unclassified
show: operator on: operand
	^ self subclasses
		detect: [ :cl | cl canVisualize: operator ]
		ifFound: [ :cl | ^ cl show: operator on: operand ]
	