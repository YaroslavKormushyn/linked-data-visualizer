as yet unclassified
block: aCommandBlock control: aControl when: whenControl
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	(varControls contains: whenControl)
		ifFalse: [ Error signal: 'Invalid variable control: ' , whenControl asString ].
	block := aCommandBlock.
	control := aControl.
	when := whenControl