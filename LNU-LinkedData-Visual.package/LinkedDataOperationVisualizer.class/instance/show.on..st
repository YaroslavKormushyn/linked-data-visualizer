as yet unclassified
show: operator on: operand
	operands := Dictionary newFrom: {(#source -> operand)}.
	dataVisualizers := Dictionary
		newFrom:
			{(#source
				-> (LinkedDataVisualizer on: operand withView: composer view))}.
				composer group: #source.
	operation := operator.
	linkConfigs := self getDefaultLinkConfiguration.
	operationBlock := [ [ operand perform: operator asSymbol ]
		ensure: [ self unlink ] ].
	process := operationBlock newProcess.
	^ composer view