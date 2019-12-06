as yet unclassified
getDefaultResultMatrixLinkConfiguration
	^ {(TempVarConfig
		block: [ :resultMatrix | 
			| resultMatrixRowsUpdate |
			Transcript
				show: 'write to result';
				cr.
			operands at: #result put: resultMatrix.
			"initialize the view for the updates not to fail"
			self addResultVisualizer.
			self addMarkerElements.
			self setPositions.
			
			"make it not like that"
			"(MethodConfig
				block: [ Transcript
						show: 'update result';
						cr.
					self updateResultWith: resultMatrix ]
				control: #after
				instance: (operands at: #source)
				when: #all
				selector: #value
				arguments: nil
				ast:
					((operands at: #source) class >> operation) ast statements second
						arguments second statements fourth) getLink."
			"send update that the UI can be initialized"
			semaphore signal.
			"wait for input before starting the operation"
			process suspend ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #result
		when: {#after . #write}) selfValue}