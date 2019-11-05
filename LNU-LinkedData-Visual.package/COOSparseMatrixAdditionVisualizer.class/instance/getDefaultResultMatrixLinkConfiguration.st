as yet unclassified
getDefaultResultMatrixLinkConfiguration
	^ {(TempVarLinkConfig
		block: [ :value | 
			| resultMatrixUpdateLinkLast |
			operands at: #result put: value.
			"initialize the view for the updates not to fail"
			self addResultVisualizer.
			self setPositions.
			resultMatrixUpdateLinkLast := (SlotLinkConfig
				block: [ self updateResultWith: value.
					"replace it with a new one without the suspend"
					self
						addLinks:
							{(SlotLinkConfig
								block: [ self updateResultWith: value ]
								control: #after
								instance: value
								slotName: #last
								when: #write) getLink}.
					"signal to root multiplication method that we finished initializing"
					semaphore signal.
					"wait for input before starting the operation"
					process suspend ]
				control: #after
				instance: value
				slotName: #last
				when: #write)
				oneShot;
				getLink.
			self
				addLinks:
					{(SlotLinkConfig
						block: [ self updateResultWith: value ]
						control: #after
						instance: value
						slotName: #first
						when: #write) getLink.
					resultMatrixUpdateLinkLast} ]
		control: #after
		instance: (operands at: #left)
		methodName: #+
		tempVarName: #result
		when: #write) selfValue }