initialization
setMultiLinksOn: matrixInstance
	| leftMarkerLinkBefore leftMarkerLinkAfter rightMarkerLinkBefore rightMarkerLinkAfter method sumLink |
	method := #byMatrix:.
	self
		setMultiLinksForCurrProcElementIndexOn: matrixInstance
		inMethod: method.
	self setMultiLinksForResultOn: matrixInstance inMethod: method.
	self setMultiLinksForRightMatrixOn: matrixInstance inMethod: method.
	"set highlights on elements which were added to sum according to algorithm in the method"
	sumLink := MetaLink new.
	sumLink
		metaObject: [ :sumValue | 
			sumValue ~= 0
				ifTrue: [ self
						highlightModels:
							{leftMatrixMarker.
							rightMatrixMarker}.
					delay wait ] ].
	sumLink selector: #value:.
	sumLink arguments: #(value).
	sumLink control: #after.
	matrixInstance
		link: sumLink
		toTemporaryNamed: #sum
		inMethod: method
		option: #write.
	"remove selection from previous marker element"
	leftMarkerLinkBefore := MetaLink new.
	leftMarkerLinkBefore
		metaObject: [ :value | 
			value isNotNil
				ifTrue: [ self deselectModel: value ] ].
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
			leftMatrixMarker := element.
			"draw the marker element on the view if its the initialization"
			leftMarkerElement isNil
				ifTrue: [ leftMarkerElement := (COOSparseMatrixVisualizer new
						getElementShapeScaled: 5) elementOn: element ].
			"select the element and update the view"
			element isNotNil
				ifTrue: [ self selectModel: element.
					leftMarkerElement updateModelAndRedraw: element.
					delay wait ] ].
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
				ifTrue: [ self deselectModel: value ] ].
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
			rightMatrixMarker := element.
			rightMarkerElement isNil
				ifTrue: [ rightMarkerElement := (COOSparseMatrixVisualizer new
						getElementShapeScaled: 5) elementOn: element ].
			element isNotNil
				ifTrue: [ self selectModel: element.
					rightMarkerElement updateModelAndRedraw: element.
					delay wait ] ].
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
			rightMarkerLinkAfter.
			sumLink}