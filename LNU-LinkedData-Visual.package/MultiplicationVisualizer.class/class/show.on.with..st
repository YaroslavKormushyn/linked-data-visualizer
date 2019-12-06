as yet unclassified
show: operator on: leftOperand with: rightOperand
	^ self subclasses
		detect: [ :cl | leftOperand class isKindOf: cl objectType class ]
		ifFound: [ :cl | cl new show: operator on: leftOperand with: rightOperand ]
		ifNone: [ self new show: operator on: leftOperand with: rightOperand ]