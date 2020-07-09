initialization
setMultiLinksForCurrProcElementIndexOn: matrixInstance inMethod: methodName
	"Set links for the index in label 'Now processing'"

	| leftRowIndexLink rightColumnIndexLink |
	leftRowIndexLink := MetaLink new.
	leftRowIndexLink
		metaObject: [ :value | 
			currentLeftRow := value.
			nowProcessingElementIndex
				model:
					{value.
					currentRightColumn}.
			nowProcessingElementIndex update ].
	leftRowIndexLink selector: #value:.
	leftRowIndexLink arguments: #(value).
	leftRowIndexLink control: #after.
	matrixInstance
		link: leftRowIndexLink
		toTemporaryNamed: #currentLeftRow
		inMethod: methodName
		option: #write.
	rightColumnIndexLink := MetaLink new.
	rightColumnIndexLink
		metaObject: [ :value | 
			currentRightColumn := value.
			nowProcessingElementIndex
				model:
					{currentLeftRow.
					value}.
			nowProcessingElementIndex update ].
	rightColumnIndexLink selector: #value:.
	rightColumnIndexLink arguments: #(value).
	rightColumnIndexLink control: #after.
	matrixInstance
		link: rightColumnIndexLink
		toTemporaryNamed: #currentRightColumn
		inMethod: methodName
		option: #write.
	metaLinks
		addAll:
			{leftRowIndexLink.
			rightColumnIndexLink}