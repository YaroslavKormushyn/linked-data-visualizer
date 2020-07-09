arithmetic
* anOperand
	(anOperand isKindOf: Number)
		ifTrue: [ ^ self byNumber: anOperand ].
	(anOperand isMemberOf: COOSparseMatrix)
		ifTrue: [ ^ self byMatrix: anOperand ].
	Error signal: 'Operand must be a number or of type COOSparseMatrix'