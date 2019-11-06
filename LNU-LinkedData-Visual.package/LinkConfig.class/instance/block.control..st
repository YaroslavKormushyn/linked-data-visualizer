as yet unclassified
block: aCommandBlock control: aControl
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	block := aCommandBlock.
	control := aControl.