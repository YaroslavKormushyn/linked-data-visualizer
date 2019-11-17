as yet unclassified
getViewUpdateLinkConfiguration
	"set links for element update on value change"

	^ (((operands at: #left) viewElements
		flatCollect: [ :node | 
			(updateMessageDict at: node class)
				collect: [ :updateMsg | 
					MethodLinkConfig
						block: [ (composer view elementsFromModel: node) elements
								do: [ :el | el updateModelAndRedraw: node ] ]
						control: #after
						instance: node
						methodName: updateMsg asSymbol ] ])
		,
			((operands at: #right) viewElements
				flatCollect: [ :node | 
					(updateMessageDict at: node class)
						collect: [ :updateMsg | 
							MethodLinkConfig
								block: [ (composer view elementsFromModel: node) elements
										do: [ :el | el updateModelAndRedraw: node ] ]
								control: #after
								instance: node
								methodName: updateMsg asSymbol ] ])) asOrderedCollection