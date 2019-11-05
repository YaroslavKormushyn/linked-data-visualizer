as yet unclassified
block: aCommandBlock control: aControl instance: anInstance when: whenControl selector: aSelector arguments: args
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	(varControls contains: whenControl)
		ifFalse: [ Error signal: 'Invalid variable control: ' , whenControl asString ].
	anInstance ifNil: [ Error signal: 'Binding instance cannot be nil.' ].
	block := aCommandBlock.
	control := aControl.
	instance := anInstance.
	when := whenControl.
	selector := aSelector asSymbol.
	arguments := args collect: [ :arg | arg asSymbol ]