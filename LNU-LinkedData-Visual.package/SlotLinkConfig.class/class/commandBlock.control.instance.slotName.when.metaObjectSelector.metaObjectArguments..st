as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance slotName: slotName when: whenControl metaObjectSelector: selector metaObjectArguments: args
	^ (self new
		commandBlock: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		metaObjectSelector: selector
		metaObjectArguments: args) slotName: slotName