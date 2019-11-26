as yet unclassified
block: aCommandBlock control: aControl instance: anInstance slotName: slotName when: whenControl selector: selector arguments: args
	^ (self
		block: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		selector: selector
		arguments: args) slotName: slotName