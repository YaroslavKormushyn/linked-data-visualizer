as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance slotName: slotName when: whenControl metaObjectSelector: selector
	^ (self new
		commandBlock: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		metaObjectSelector: selector) slotName: slotName