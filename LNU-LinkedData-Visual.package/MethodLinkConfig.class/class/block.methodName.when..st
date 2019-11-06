as yet unclassified
block: aCommandBlock methodName: methodName when: controlAndWhen
	^ (self new block: aCommandBlock  when: controlAndWhen)
		methodName: methodName