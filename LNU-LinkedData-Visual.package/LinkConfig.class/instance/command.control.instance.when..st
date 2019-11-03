as yet unclassified
command: aCommand control: aControl instance: anInstance when: whenControl
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	(varControls contains: whenControl)
		ifFalse: [ Error signal: 'Invalid variable control: ' , whenControl asString ].
	anInstance isNil
		ifTrue: [ Error signal: 'Binding instance cannot be nil.' ]