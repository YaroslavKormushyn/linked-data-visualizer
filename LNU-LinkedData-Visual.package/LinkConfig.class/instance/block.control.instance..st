as yet unclassified
block: aCommandBlock control: aControl instance: anInstance
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	anInstance ifNil: [ Error signal: 'Binding instance cannot be nil.' ].
	block := aCommandBlock.
	control := aControl.
	instance := anInstance