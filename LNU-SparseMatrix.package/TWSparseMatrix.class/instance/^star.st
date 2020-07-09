arithmetic
* anOperand
	(anOperand isNumber)
		ifTrue: [ ^ self byNumber: anOperand ].
	(anOperand isMemberOf: self class)
		ifTrue: [ ^ self byMatrix: anOperand ].
	Error signal: 'Unknown type of operand for this operation'