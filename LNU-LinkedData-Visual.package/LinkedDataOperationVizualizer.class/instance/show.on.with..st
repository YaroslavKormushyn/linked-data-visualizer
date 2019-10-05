as yet unclassified
show: operator on: leftOperand with: rightOperand
	operands := Dictionary newFrom: {(#left -> leftOperand) . (#right -> rightOperand)}.
	operation := operator.
	operationBlock := [ [ leftOperand perform: operator asSymbol with: rightOperand ]
		ensure: [ self unlink ] ].
	process := operationBlock newProcess.
	[ self setLinks.
	process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ].
	self setUpMenu.
	^ composer view