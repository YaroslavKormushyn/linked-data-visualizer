as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance classVarName: varName when: whenControl metaObjectSelector: selector metaObjectArguments: args
	^ (self new
		commandBlock: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		metaObjectSelector: selector
		metaObjectArguments: args)
		classVarName: varName