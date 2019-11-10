as yet unclassified
getViewUpdateLinkConfiguration
	"set links for element update on value change"

	^ (((operands at: #left) viewElements
		collect: [ :node | 
			MethodLinkConfig
				block: [ (composer view elementsFromModel: node) elements do: [ :el | el updateModelAndRedraw: node ] ]
				control: #after
				instance: node
				methodName: #value: ])
		,
			((operands at: #right) viewElements
				collect: [ :node | 
					MethodLinkConfig
						block: [ (composer view elementsFromModel: node)  elements do: [ :el | el updateModelAndRedraw: node ] ]
						control: #after
						instance: node
						methodName: #value: ])) asOrderedCollection