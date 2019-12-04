as yet unclassified
getDefaultResultMatrixLinkConfiguration
	^ {(TempVarConfig
		block: [ :value | 
			| resultMatrixRowsUpdate |
			operands at: #result put: value.
			"initialize the view for the updates not to fail"
			self addResultVisualizer.
			self addMarkerElements.
			self setPositions.
			resultMatrixRowsUpdate := (SlotConfig
				block: [ self updateResultWith: value ]
				instance: value
				slotName: #rows
				when: {#after . #read}) getLink.
			self addLink: resultMatrixRowsUpdate.
			"send update that the UI can be initialized"
			semaphore signal ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #result
		when: {#after . #write}) selfValue}