as yet unclassified
block: aCommandBlock control: aControl instance: anInstance methodName: methodName tempVarName: tempVarName when: whenControl selector: selector arguments: args
	^ (self new
		block: aCommandBlock
		control: aControl
		instance: anInstance
		methodName: methodName
		when: whenControl
		selector: selector
		arguments: args) tempVarName: tempVarName