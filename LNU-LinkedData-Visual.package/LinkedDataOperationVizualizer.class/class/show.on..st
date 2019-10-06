as yet unclassified
show: operator on: operand
	^ UnaryOperationVisualizer allSubclasses detect: [ :cl | cl canVisualize: operator ]
		ifFound: [ :cl | cl new show: operator on: operand ].