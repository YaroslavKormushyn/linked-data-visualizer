as yet unclassified
commandBlock: aCommandBlock control: aControl instance: anInstance methodName: methodName when: whenControl
	^ (self new
		commandBlock: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl) methodName: methodName