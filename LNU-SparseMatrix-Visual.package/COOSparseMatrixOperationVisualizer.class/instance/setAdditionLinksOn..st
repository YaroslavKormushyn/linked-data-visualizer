initialization
setAdditionLinksOn: matrixInstance
	| leftMarkerLinkBefore leftMarkerLinkAfter rightMarkerLinkBefore rightMarkerLinkAfter method |
	method := #+.
	"self
		setMultiLinksForCurrProcElementIndexOn: matrixInstance
		inMethod: method."
	self setAdditionLinksForResultOn: matrixInstance inMethod: method.
	"self setAdditionLinksForRightMatrixOn: matrixInstance inMethod: method."
	"set highlights on elements which were added to sum according to algorithm in the method"


	"remove selection from previous marker element"
	leftMarkerLinkBefore := MetaLink new.
	leftMarkerLinkBefore
		metaObject: [ :value | 
			value isNotNil
				ifTrue: [ self deselectModel: value inGroup: #left ] ].
	leftMarkerLinkBefore selector: #value:.
	leftMarkerLinkBefore arguments: #(value).
	leftMarkerLinkBefore control: #before.
	matrixInstance
		link: leftMarkerLinkBefore
		toTemporaryNamed: #leftMatrixMarker
		inMethod: method
		option: #write.
	"select current marker element"
	leftMarkerLinkAfter := MetaLink new.
	leftMarkerLinkAfter
		metaObject: [ :element | 
			| leftMarkerHighlightLink |
			leftMatrixMarker := element.
			"highlights marker if it was copied - most common path in the method"
			"uninstalls itself after one use since the algorithm does not revert"
			element isNotNil
				ifTrue: [ leftMarkerHighlightLink := MetaLink new.
					leftMarkerHighlightLink
						metaObject: [ self highlightModel: element inGroup: #left.
							Transcript
								show: 'highlight left ' , (element row @ element column) asString;
								cr.
							delay copy wait.
							leftMarkerHighlightLink uninstall ].
					leftMarkerHighlightLink selector: #value.
					leftMarkerHighlightLink control: #after.
					element link: leftMarkerHighlightLink toMethodNamed: #copy ].
			"draw the marker element on the view if its the initialization"
			leftMarkerElement isNil
				ifTrue: [ leftMarkerElement := (COOSparseMatrixVisualizer new
						getElementShapeScaled: 5) elementOn: element ].
			"select the element and update the view"
			element isNotNil
				ifTrue: [ self selectModel: element inGroup: #left.
					Transcript
						show: 'select left ' , (element row @ element column) asString;
						cr.
					leftMarkerElement updateModelAndRedraw: element.
					delay copy wait ] ].
	leftMarkerLinkAfter selector: #value:.
	leftMarkerLinkAfter arguments: #(value).
	leftMarkerLinkAfter control: #after.
	matrixInstance
		link: leftMarkerLinkAfter
		toTemporaryNamed: #leftMatrixMarker
		inMethod: method
		option: #write.
	"remove selection from previous marker element"
	rightMarkerLinkBefore := MetaLink new.
	rightMarkerLinkBefore
		metaObject: [ :value | 
			value isNotNil
				ifTrue: [ self deselectModel: value inGroup: #right ] ].
	rightMarkerLinkBefore selector: #value:.
	rightMarkerLinkBefore arguments: #(value).
	rightMarkerLinkBefore control: #before.
	matrixInstance
		link: rightMarkerLinkBefore
		toTemporaryNamed: #rightMatrixMarker
		inMethod: method
		option: #write.
	"select current right matrix marker element"
	rightMarkerLinkAfter := MetaLink new.
	rightMarkerLinkAfter
		metaObject: [ :element | 
			| rightMarkerHighlightLink |
			rightMatrixMarker := element.
			"highlights marker if it was copied - most common path in the method"
			"uninstalls itself after one use since the algorithm does not revert"
			element isNotNil
				ifTrue: [ rightMarkerHighlightLink := MetaLink new.
					rightMarkerHighlightLink
						metaObject: [ :elementCopy | 
							"elementCopy is the copied object which we use to set a link to value:"
							"with that we know if it's selecting left and right markers or only one of them"
							| leftMatrixMarkerHightlightLink |
							leftMatrixMarkerHightlightLink := MetaLink new.
							leftMatrixMarkerHightlightLink
								metaObject: [ "the link is set to right only according to the method code"
									"left is never the object which is copied in this situation"
									self highlightModel: leftMatrixMarker inGroup: #left.
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
							self highlightModel: element inGroup: #right.
							Transcript
								show: 'highlight right ' , (element row @ element column) asString;
								cr.
							delay copy wait.
							"add to metaLinks in case it won't run to uninstall after animation ends"
							"metaLinks add: leftMatrixMarkerHightlightLink."
							rightMarkerHighlightLink uninstall ].
					rightMarkerHighlightLink selector: #value:.
					rightMarkerHighlightLink arguments: #(value).
					rightMarkerHighlightLink control: #after.
					element link: rightMarkerHighlightLink toMethodNamed: #copy.
					metaLinks add: rightMarkerHighlightLink ].
			rightMarkerElement isNil
				ifTrue: [ rightMarkerElement := (COOSparseMatrixVisualizer new
						getElementShapeScaled: 5) elementOn: element ].
			element isNotNil
				ifTrue: [ self selectModel: element inGroup: #right.
					Transcript
						show: 'select right ' , (element row @ element column) asString;
						cr.
					rightMarkerElement updateModelAndRedraw: element.
					delay copy wait ] ].
	rightMarkerLinkAfter selector: #value:.
	rightMarkerLinkAfter arguments: #(value).
	rightMarkerLinkAfter control: #after.
	matrixInstance
		link: rightMarkerLinkAfter
		toTemporaryNamed: #rightMatrixMarker
		inMethod: method
		option: #write.
	metaLinks
		addAll:
			{leftMarkerLinkBefore.
			leftMarkerLinkAfter.
			rightMarkerLinkBefore.
			rightMarkerLinkAfter}