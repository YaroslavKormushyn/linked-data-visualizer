as yet unclassified
block: aCommandBlock instance: anInstance methodName: methodName tempVarName: tempVarName when: controlAndWhen
	^ (self new
		block: aCommandBlock
		instance: anInstance
		methodName: methodName
		when: controlAndWhen) tempVarName: tempVarName