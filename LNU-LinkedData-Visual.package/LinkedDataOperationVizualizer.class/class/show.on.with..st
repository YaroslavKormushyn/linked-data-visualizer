as yet unclassified
show: operator on: leftOperand with: rightOperand
	^ BinaryOperationVisualizer allSubclasses
		detect: [ :cl | cl canVisualize: operator ]
		ifFound: [ :cl | cl new show: operator on: leftOperand with: rightOperand  ]