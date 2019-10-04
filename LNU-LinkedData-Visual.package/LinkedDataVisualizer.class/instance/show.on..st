as yet unclassified
show: operator on: operand
	operator isNil | operand isNil
		| (operand respondsTo: operator asSymbol) not
		ifTrue: [ Error signal: 'What?' ].
	operands := Dictionary newFrom: {(#left -> operand)}.
	operation := operator.
	operationBlock := [ [ operand perform: operator asSymbol ]
		ensure: [ self unlink ] ].
	process := operationBlock newProcess.
	"[ self setLinks.
	process resume.
	semaphore wait ] on: Error fork: [ :ex | Error signal: ex ]."
	self setUpMenu.
	^ composer view