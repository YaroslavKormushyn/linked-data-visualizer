as yet unclassified
show: operator on: operand
	operands := Dictionary newFrom: {(#left -> operand)}.
	dataVisualizers := Dictionary
		newFrom:
			{(#left -> (LinkedDataVisualizer on: operand withView: composer view))}.
	operation := operator.
	operationBlock := [ [ operand perform: operator asSymbol ]
		ensure: [ self unlink ] ].
	process := operationBlock newProcess.
	[ self setLinks.
	process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ].
	self setUpMenu.
	^ composer view