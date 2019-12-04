as yet unclassified
getDefaultOperandsLinkConfiguration
	^ {((TempVarConfig
		block: [ :tempList :columnBlockContext | 
			| column |
			column := columnBlockContext tempNamed: #columnIndex.
			(composer hasGroup: #newRow)
				ifTrue: [ composer removeGroup: #newRow ].
			"TODO: add new row label prior to this call"
			self updateRowWith: tempList rowIndex: column.
			(MethodConfig
				block: [  :rowBlockContext | 
					| row |
					row := rowBlockContext tempNamed: #rowIndex.
					"TODO: find a way to deselect the previous"
					composer
						selectModel: ((operands at: #left) at: row at: column)
						inGroup: #source.
					 ]
				instance: tempList
				methodName: #addLast:
				selector: #value:
				arguments: #(context)) control: #before; getLink.
				(MethodConfig
				block: [ 
					self updateRowWith: tempList rowIndex: column.
					 ]
				instance: tempList
				methodName: #addLast: control: #after) getLink. ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #tempList
		when: {#after . #write})
		arguments: #(value context);
		selector: #value:value:)}