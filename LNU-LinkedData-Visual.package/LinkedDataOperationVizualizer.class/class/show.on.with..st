as yet unclassified
show: operator on: leftOperand with: rightOperand
	^ BinaryOperationVisualizer subclasses
		detect: [ :cl | cl canVisualize: operator ]
		ifFound: [ :cl | cl show: operator on: leftOperand with: rightOperand ]