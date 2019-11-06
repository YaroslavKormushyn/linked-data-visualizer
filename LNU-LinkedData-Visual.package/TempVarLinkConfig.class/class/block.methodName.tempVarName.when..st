as yet unclassified
block: aCommandBlock methodName: methodName tempVarName: tempVarName when: controlAndWhen
	^ (self new
		block: aCommandBlock
		methodName: methodName
		when: controlAndWhen) tempVarName: tempVarName