as yet unclassified
block: aCommandBlock control: aControl instance: anInstance slotName: slotName when: whenControl
	^ (self new
		block: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl) slotName: slotName