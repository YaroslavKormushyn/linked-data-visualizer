deprecated - compatibility layer
setLinksForMultiplicationOn: matrixInstance
	| leftMarkerHighlightLink rightMarkerHighlightLink resultMatrixUpdateLinkFirst resultMatrixUpdateLinkLast |
	leftMarkerHighlightLink := MetaLink new.
	leftMarkerHighlightLink
		metaObject: [ :value | 
			self highlightModel: value.
			delay wait ].
	leftMarkerHighlightLink selector: #value:.
	leftMarkerHighlightLink arguments: #(value).
	leftMarkerHighlightLink control: #after.
	rightMarkerHighlightLink := MetaLink new.
	rightMarkerHighlightLink
		metaObject: [ :value | 
			self highlightModel: value.
			delay wait ].
	rightMarkerHighlightLink selector: #value:.
	rightMarkerHighlightLink arguments: #(value).
	rightMarkerHighlightLink control: #after.
	leftMatrixMarker
		link: leftMarkerHighlightLink
		toSlotNamed: #value
		option: #read.
	rightMatrixMarker
		link: rightMarkerHighlightLink
		toSlotNamed: #value
		option: #read.
	resultMatrixUpdateLinkFirst := MetaLink new.
	resultMatrixUpdateLinkFirst
		metaObject: [ :value | 
			self updateResultWith: value.
			Transcript
				show: 'updated first in result';
				cr ].
	resultMatrixUpdateLinkFirst selector: #value:.
	resultMatrixUpdateLinkFirst arguments: #(value).
	resultMatrixUpdateLinkFirst control: #after.
	resultMatrix
		link: resultMatrixUpdateLinkFirst
		toSlotNamed: #first
		option: #write.
	resultMatrixUpdateLinkLast := MetaLink new.
	resultMatrixUpdateLinkLast
		metaObject: [ :value | 
			self updateResultWith: value.
			Transcript
				show: 'updated last in result';
				cr ].
	resultMatrixUpdateLinkLast selector: #value:.
	resultMatrixUpdateLinkLast arguments: #(value).
	resultMatrixUpdateLinkLast control: #after.
	resultMatrix
		link: resultMatrixUpdateLinkLast
		toSlotNamed: #last
		option: #write