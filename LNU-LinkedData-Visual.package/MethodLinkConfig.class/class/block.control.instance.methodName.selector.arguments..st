as yet unclassified
block: aCommandBlock control: aControl instance: anInstance methodName: methodName selector: selector arguments: args
	^ (self new
		block: aCommandBlock
		control: aControl
		instance: anInstance
		selector: selector
		arguments: args) methodName: methodName