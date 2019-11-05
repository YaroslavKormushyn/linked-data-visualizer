as yet unclassified
block: aCommandBlock control: aControl instance: anInstance classVarName: varName when: whenControl
	^ (self new
		block: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl) classVarName: varName