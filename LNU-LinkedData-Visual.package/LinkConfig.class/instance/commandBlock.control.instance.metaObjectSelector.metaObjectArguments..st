as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance metaObjectSelector: selector metaObjectArguments: args
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	anInstance isNil
		ifTrue: [ Error signal: 'Binding instance cannot be nil.' ].
	commandBlock := aCommandBlock.
	control := aControl.
	instance := anInstance.
	metaObjectSelector := selector asSymbol.
	metaObjectArguments := args collect: [ :arg | arg asSymbol ]