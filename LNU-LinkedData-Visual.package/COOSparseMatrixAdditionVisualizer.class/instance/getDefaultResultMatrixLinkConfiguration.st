as yet unclassified
getDefaultResultMatrixLinkConfiguration
	^ {(TempVarConfig
		block: [ :value | 
			| resultMatrixUpdateLinkLast |
			operands at: #result put: value.
			"initialize the view for the updates not to fail"
			self addResultVisualizer.
			self addMarkerElements.
			self setPositions.
			resultMatrixUpdateLinkLast := (SlotConfig
				block: [ self updateResultWith: value.
					"replace it with a new one without the suspend"
					self
						addLink:
							(SlotConfig
								block: [ self updateResultWith: value ]
								instance: value
								slotName: #last
								when: {#after . #write}) getLink.
					"signal to root multiplication method that we finished initializing"
					semaphore signal.
					"wait for input before starting the operation"
					process suspend ]
				instance: value
				slotName: #last
				when: {#after . #write})
				oneShot;
				getLink.
			self
				addLinks:
					{(SlotConfig
						block: [ self updateResultWith: value ]
						instance: value
						slotName: #first
						when: {#after . #write}) getLink.
					resultMatrixUpdateLinkLast} ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #result
		when: {#after . #write}) selfValue}