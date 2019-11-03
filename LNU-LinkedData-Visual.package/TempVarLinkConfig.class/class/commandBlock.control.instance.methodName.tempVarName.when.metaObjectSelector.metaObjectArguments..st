as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance methodName: methodName tempVarName: tempVarName when: whenControl metaObjectSelector: selector metaObjectArguments: args
	^ (self new
		commandBlock: aCommandBlock
		control: aControl
		instance: anInstance
		methodName: methodName
		when: whenControl
		metaObjectSelector: selector
		metaObjectArguments: args) tempVarName: tempVarName