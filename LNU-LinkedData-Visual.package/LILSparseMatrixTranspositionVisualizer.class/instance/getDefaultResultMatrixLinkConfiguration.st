as yet unclassified
getDefaultResultMatrixLinkConfiguration
	^ {((TempVarConfig
		block: [ :value | 
			| resultMatrixRowsUpdate |
			operands at: #result put: value.
			"initialize the view for the updates not to fail"
			self addResultVisualizer.
			self addMarkerElements.
			self setPositions.
			resultMatrixRowsUpdate := (MethodConfig
				block: [ self updateResultWith: value ]
				instance: value rows
				methodName: #at:put:
				control: #after)
				getLink.
			self addLink: resultMatrixRowsUpdate.
			"send update that the UI can be initialized"
			semaphore signal ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #result
		when: {#after . #write})
		selfValue;
		oneShot)}