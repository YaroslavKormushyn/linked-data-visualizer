as yet unclassified
show: operator on: leftOperand with: rightOperand
	| leftVisualizer rightVisualizer |
	operands := Dictionary
		newFrom:
			{(#left -> leftOperand).
			(#right -> rightOperand)}.
	leftVisualizer := LinkedDataVisualizer
		on: leftOperand
		withView: composer view.
	composer group: #left.
	rightVisualizer := LinkedDataVisualizer
		on: rightOperand
		withView: composer view.
	composer group: #right.
	dataVisualizers := Dictionary
		newFrom:
			{(#left -> leftVisualizer).
			(#right -> rightVisualizer)}.
			

	operation := operator.	linkConfigs := self getDefaultLinkConfiguration.
	operationBlock := [ [ leftOperand
		perform: operator asSymbol
		with: rightOperand ]
		ensure: [ self unlink ] ].
	process := operationBlock newProcess