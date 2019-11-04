as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	anInstance ifNil: [ Error signal: 'Binding instance cannot be nil.' ].
	commandBlock := aCommandBlock.
	control := aControl.
	instance := anInstance