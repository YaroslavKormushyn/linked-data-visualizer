as yet unclassified
getDefaultOperandsLinkConfiguration
	| method |
	method := #+.
	^ {(TempVarLinkConfig
		commandBlock: [ :value | 
			"remove selection from previous marker element"
			value isNotNil
				ifTrue: [ composer deselectModel: value inGroup: #left ] ]
		control: #before
		instance: (operands at: #left)
		methodName: method
		tempVarName: #leftMatrixMarker
		when: #write
		metaObjectSelector: #value:
		metaObjectArguments: #(value)) getLink.
	(TempVarLinkConfig
		commandBlock: [ :element | 
			| leftMarkerHighlightLink |
			"select current marker element"
			leftMatrixMarker := element.
			"highlights marker if it was copied - most common path in the method"
			"uninstalls itself after one use since the algorithm does not revert"
			element
				ifNotNil: [ leftMarkerHighlightLink := (MethodLinkConfig
						commandBlock: [ composer highlightModel: element inGroup: #left.
							Transcript
								show: 'highlight left ' , (element row @ element column) asString;
								cr.
							delay copy wait.
							self removeLink: leftMarkerHighlightLink ]
						control: #after
						instance: element
						methodName: #copy) getLink.
					self addLink: leftMarkerHighlightLink ].
			"draw the marker element on the view if its the initialization"
			leftMarkerElement
				ifNil: [ leftMarkerElement := (COOSparseMatrixVisualizer new
						getElementShapeScaled: 5) elementOn: element ].
			"select the element and update the view"
			element
				ifNotNil: [ composer selectModel: element inGroup: #left.
					Transcript
						show: 'select left ' , (element row @ element column) asString;
						cr.
					leftMarkerElement updateModelAndRedraw: element.
					delay copy wait ] ]
		control: #before
		instance: (operands at: #left)
		methodName: method
		tempVarName: #leftMatrixMarker
		when: #write
		metaObjectSelector: #value:
		metaObjectArguments: #(value)) getLink.
	(TempVarLinkConfig
		commandBlock: [ :value | 
			"remove selection from previous marker element"
			value isNotNil
				ifTrue: [ composer deselectModel: value inGroup: #right ] ]
		control: #before
		instance: (operands at: #left)
		methodName: method
		tempVarName: #rightMatrixMarker
		when: #write
		metaObjectSelector: #value:
		metaObjectArguments: #(value)) getLink.
	(TempVarLinkConfig
		commandBlock: [ :element | 
			| rightMarkerHighlightLink |
			rightMatrixMarker := element.
			"highlights marker if it was copied - most common path in the method"
			"uninstalls itself after one use since the algorithm does not revert"
			element
				ifNotNil: [ rightMarkerHighlightLink := (MethodLinkConfig
						commandBlock: [ :elementCopy | 
							"elementCopy is the copied object which we use to set a link to value:"
							"with that we know if it's selecting left and right markers or only one of them"
							| leftMatrixMarkerHightlightLink |
							leftMatrixMarkerHightlightLink := MetaLink new.
							leftMatrixMarkerHightlightLink
								metaObject: [ "the link is set to right only according to the method code"
									"left is never the object which is copied in this situation"
									composer highlightModel: leftMatrixMarker inGroup: #left.
									Transcript
										show:
											'highlight left '
												, (leftMatrixMarker row @ leftMatrixMarker column) asString;
										cr.
									delay copy wait
									"leftMatrixMarkerHightlightLink uninstall" ].
							leftMatrixMarkerHightlightLink selector: #value.
							leftMatrixMarkerHightlightLink control: #after.
							elementCopy
								link: leftMatrixMarkerHightlightLink
								toMethodNamed: #value:.
							"highlight the right marker and uninstall itself after first use"
							composer highlightModel: element inGroup: #right.
							Transcript
								show: 'highlight right ' , (element row @ element column) asString;
								cr.
							delay copy wait.
							"add to metaLinks in case it won't run to uninstall after animation ends"
							"metaLinks add: leftMatrixMarkerHightlightLink."
							rightMarkerHighlightLink uninstall ]
						control: #after
						instance: element
						methodName: #copy
						metaObjectSelector: #value:
						metaObjectArguments: #(value)) getLink.
					self addLink: rightMarkerHighlightLink ].
			rightMarkerElement
				ifNil: [ rightMarkerElement := (COOSparseMatrixVisualizer new
						getElementShapeScaled: 5) elementOn: element ].
			element ifNotNil: [ composer selectModel: element inGroup: #right.
					Transcript
						show: 'select right ' , (element row @ element column) asString;
						cr.
					rightMarkerElement updateModelAndRedraw: element.
					delay copy wait ] ]
		control: #before
		instance: (operands at: #left)
		methodName: method
		tempVarName: #rightMatrixMarker
		when: #write
		metaObjectSelector: #value:
		metaObjectArguments: #(value)) getLink}