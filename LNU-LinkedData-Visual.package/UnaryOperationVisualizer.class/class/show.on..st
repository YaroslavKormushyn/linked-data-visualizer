as yet unclassified
show: operator on: operand
	^ self subclasses
		detect: [ :cl | operand class isKindOf: cl objectType class ]
		ifFound: [ :cl | cl show: operator on: operand ]
		ifNone: [ self new show: operator on: operand ]