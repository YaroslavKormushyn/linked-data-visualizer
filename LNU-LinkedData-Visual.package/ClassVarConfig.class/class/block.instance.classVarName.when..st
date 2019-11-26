as yet unclassified
block: aCommandBlock instance: anInstance classVarName: varName when: controlAndWhen
	"simplified control and when init"

	^ (self
		block: aCommandBlock
		instance: anInstance
		when: controlAndWhen) classVarName: varName