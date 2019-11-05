as yet unclassified
block: aCommandBlock control: aControl instance: anInstance methodName: methodName tempVarName: tempVarName when: whenControl
	^ (self new
		block: aCommandBlock
		control: aControl
		instance: anInstance
		methodName: methodName
		when: whenControl) tempVarName: tempVarName