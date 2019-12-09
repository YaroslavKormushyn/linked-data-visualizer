as yet unclassified
getDefaultResultMatrixLinkConfiguration
	^ {(TempVarConfig
		block: [ :value | 
			| resultMatrixFinishRowLoops resultMatrixFinishColumnLoops |
			Transcript
				show: 'write to result';
				cr.
			operands at: #result put: value.
			"initialize the view for the updates not to fail"
			self addResultVisualizer.
			self addMarkerElements.
			self addCaptions.
			self setPositions.
			resultMatrixFinishRowLoops := (MethodConfig
				block: [ Transcript
						show: 'result row withIndexDo:';
						cr.
					
					self updateResultWith: (operands at: #result).
					delay copy wait ]
				instance: value rows
				methodName: #withIndexDo:
				control: #after)
				oneShot;
				getLink.
			resultMatrixFinishColumnLoops := (MethodConfig
				block: [ Transcript
						show: 'result columns withIndexDo:';
						cr.
					
					self updateResultWith: (operands at: #result).
					self removeAdditionalElements ]
				instance: value columns
				methodName: #withIndexDo:
				control: #after)
				oneShot;
				getLink.
			self
				addLinks:
					{resultMatrixFinishRowLoops.
					resultMatrixFinishColumnLoops}.
			"signal about finished init and suspend operation awaiting input"
			semaphore signal.
			process suspend ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #result
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ Transcript
				show: 'resultMarker update';
				cr.
				leftMarkerElement model
				ifNotNil: [ leftMarkerElement model column ~= 0
						ifTrue: [ composer deselectModel: leftMarkerElement model inGroup: #left ] ].
					rightMarkerElement model
				ifNotNil: [ rightMarkerElement model row ~= 0
						ifTrue: [ composer deselectModel: rightMarkerElement model inGroup: #right ] ].
			self updateResultWith: (operands at: #result) ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #resultUpdateMarker
		when: {#after . #write})}