as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance methodName: methodName metaObjectSelector: selector metaObjectArguments: args
	^ (self new
		commandBlock: aCommandBlock
		control: aControl
		instance: anInstance
		metaObjectSelector: selector
		metaObjectArguments: args) methodName: methodName