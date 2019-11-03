as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance when: whenControl metaObjectSelector: selector metaObjectArguments: args
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	(varControls contains: whenControl)
		ifFalse: [ Error signal: 'Invalid variable control: ' , whenControl asString ].
	anInstance isNil
		ifTrue: [ Error signal: 'Binding instance cannot be nil.' ].
	commandBlock := aCommandBlock.
	control := aControl.
	instance := anInstance.
	when := whenControl.
	metaObjectSelector := selector asSymbol.
	metaObjectArguments := args collect: [ :arg | arg asSymbol ].