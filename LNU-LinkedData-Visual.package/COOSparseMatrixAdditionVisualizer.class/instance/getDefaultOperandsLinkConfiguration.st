as yet unclassified
getDefaultOperandsLinkConfiguration
	^ {(TempVarLinkConfig
		block: [ :value | 
			"remove selection from previous marker element"
			value isNotNil
				ifTrue: [ composer deselectModel: value inGroup: #left ] ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #leftMatrixMarker
		when: {#before . #write}) selfValue.
	((TempVarLinkConfig
		block: [ :element | 
			"select current marker element"
			leftMatrixMarker := element.
			"highlights marker if it was copied - most common path in the method"
			"uninstalls itself after one use since the algorithm does not revert"
			element
				ifNotNil: [ self
						addLink:
							((MethodLinkConfig
								block: [ composer highlightModel: element inGroup: #left.
									Transcript
										show: 'highlight left ' , (element row @ element column) asString;
										cr.
									delay copy wait ]
								control: #after
								instance: element
								methodName: #copy)
								oneShot;
								getLink) ].
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
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #leftMatrixMarker
		when: {#before . #write})
		selfValue;
		getLink).
	((TempVarLinkConfig
		block: [ :value | 
			"remove selection from previous marker element"
			value isNotNil
				ifTrue: [ composer deselectModel: value inGroup: #right ] ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #rightMatrixMarker
		when: {#before . #write})
		selfValue;
		getLink).
	(TempVarLinkConfig
		block: [ :element | 
			| rightMarkerHighlightLink |
			rightMatrixMarker := element.
			"highlights marker if it was copied - most common path in the method"
			"uninstalls itself after one use since the algorithm does not revert"
			element
				ifNotNil: [ rightMarkerHighlightLink := (MethodLinkConfig
						block: [ :elementCopy | 
							"elementCopy is the copied object which we use to set a link to value:"
							"with that we know if it's selecting left and right markers or only one of them"
							| leftMatrixMarkerHightlightLink |
							leftMatrixMarkerHightlightLink := (MethodLinkConfig
								block: [ "the link is set to right only according to the method code"
									"left is never the object which is copied in this situation"
									composer highlightModel: leftMatrixMarker inGroup: #left.
									Transcript
										show:
											'highlight left '
												, (leftMatrixMarker row @ leftMatrixMarker column) asString;
										cr.
									delay copy wait ]
								control: #after
								instance: elementCopy
								methodName: #value:) oneShot; getLink.
							"highlight the right marker and uninstall itself after first use"
							composer highlightModel: element inGroup: #right.
							Transcript
								show: 'highlight right ' , (element row @ element column) asString;
								cr.
							delay copy wait ]
						control: #after
						instance: element
						methodName: #copy)
						selfValue;
						oneShot;
						getLink.
					self addLink: rightMarkerHighlightLink ].
			rightMarkerElement
				ifNil: [ rightMarkerElement := (COOSparseMatrixVisualizer new
						getElementShapeScaled: 5) elementOn: element ].
			element
				ifNotNil: [ composer selectModel: element inGroup: #right.
					Transcript
						show: 'select right ' , (element row @ element column) asString;
						cr.
					rightMarkerElement updateModelAndRedraw: element.
					delay copy wait ] ]
		control: #before
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #rightMatrixMarker
		when: #write
		selector: #value:
		arguments: #(value)) getLink}