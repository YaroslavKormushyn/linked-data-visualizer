as yet unclassified
block: aCommandBlock control: aControl instance: anInstance slotName: slotName when: whenControl selector: selector
	^ (self new
		block: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		selector: selector) slotName: slotName