as yet unclassified
block: aCommandBlock instance: anInstance slotName: slotName when: controlAndWhen
	^ (self new
		block: aCommandBlock
		instance: anInstance
		when: controlAndWhen) slotName: slotName