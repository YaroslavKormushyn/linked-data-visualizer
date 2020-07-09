initialization
setAdditionLinksForResultOn: matrixInstance inMethod: methodName
	"Set links for result matrix update on viewer"

	| resultMatrixLink |
	resultMatrixLink := MetaLink new.
	resultMatrixLink
		metaObject: [ :value | 
			| resultMatrixUpdateLinkFirst resultMatrixUpdateLinkLast |
			resultMatrix := value.
			"initialize the view for the updates not to fail"
			self initializeAdditionView.
			self setPositionsForAddition.
			resultMatrixUpdateLinkFirst := MetaLink new.
			resultMatrixUpdateLinkFirst
				metaObject: [ self updateResultWith: value ].
			resultMatrixUpdateLinkFirst selector: #value.
			resultMatrixUpdateLinkFirst control: #after.
			value
				link: resultMatrixUpdateLinkFirst
				toSlotNamed: #first
				option: #write.
			resultMatrixUpdateLinkLast := MetaLink new.
			resultMatrixUpdateLinkLast
				metaObject: [ | newResultUpdateLastLink |
					self updateResultWith: value.
					"uninstall the initial block which suspends the process"
					resultMatrixUpdateLinkLast uninstall.
					"replace it with a new one without the suspend"
					newResultUpdateLastLink := MetaLink new.
					newResultUpdateLastLink
						metaObject: [ self updateResultWith: value ].
					newResultUpdateLastLink selector: #value.
					newResultUpdateLastLink control: #after.
					value
						link: newResultUpdateLastLink
						toSlotNamed: #last
						option: #write.
					"signal to root multiplication method that we finished initializing"
					semaphore signal.
					"wait for input before starting the operation"
					process suspend ].
			resultMatrixUpdateLinkLast selector: #value.
			resultMatrixUpdateLinkLast control: #after.
			value
				link: resultMatrixUpdateLinkLast
				toSlotNamed: #last
				option: #write.
			metaLinks
				addAll:
					{resultMatrixUpdateLinkFirst.
					resultMatrixUpdateLinkLast} ].
	resultMatrixLink selector: #value:.
	resultMatrixLink arguments: #(value).
	resultMatrixLink control: #after.
	matrixInstance
		link: resultMatrixLink
		toTemporaryNamed: #result
		inMethod: methodName
		option: #write.
	metaLinks add: resultMatrixLink