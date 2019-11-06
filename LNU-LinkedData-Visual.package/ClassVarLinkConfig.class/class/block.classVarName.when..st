as yet unclassified
block: aCommandBlock classVarName: varName when: controlAndWhen
"simplified control and when init"
	^ (self new block: aCommandBlock when: controlAndWhen)
		classVarName: varName