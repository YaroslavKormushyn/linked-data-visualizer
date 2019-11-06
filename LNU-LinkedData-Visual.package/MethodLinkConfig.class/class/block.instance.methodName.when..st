as yet unclassified
block: aCommandBlock instance: anInstance methodName: methodName when: controlAndWhen
	"simplified control and when init"
	^ (self new
		block: aCommandBlock
		instance: anInstance
		when: controlAndWhen) methodName: methodName