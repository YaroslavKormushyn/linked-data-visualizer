as yet unclassified
block: aCommandBlock control: aControl instance: anInstance classVarName: varName when: whenControl selector: selector arguments: args
	^ (self
		block: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		selector: selector
		arguments: args) classVarName: varName