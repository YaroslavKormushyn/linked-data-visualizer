as yet unclassified
block: aCommandBlock control: aControl instance: anInstance when: whenControl selector: selector arguments: args ast: astNode
	^ (self
		block: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		selector: selector
		arguments: args)
		ast: astNode