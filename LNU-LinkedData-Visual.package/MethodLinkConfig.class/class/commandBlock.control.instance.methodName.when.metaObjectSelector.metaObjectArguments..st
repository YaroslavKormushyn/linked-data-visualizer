as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance methodName: methodName when: whenControl metaObjectSelector: selector metaObjectArguments: args
	^ (self new
		commandBlock: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		metaObjectSelector: selector
		metaObjectArguments: args) methodName: methodName