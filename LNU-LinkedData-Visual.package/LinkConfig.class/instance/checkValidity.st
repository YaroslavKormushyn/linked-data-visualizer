as yet unclassified
checkValidity
	(operControls includes: control)
		ifFalse: [ Error signal: 'Invalid operation control: ' , control asString ].
	(varControls includes: when)
		ifFalse: [ Error signal: 'Invalid variable control: ' , when asString ].
	instance ifNil: [ Error signal: 'Binding instance cannot be nil.' ].
	block ifNil: [ Error signal: 'Code block mustn''t be nil.' ]