as yet unclassified
getDefaultOperandsLinkConfiguration
	^ {((TempVarConfig
		block: [ :tempList :columnBlockContext | 
			| row column beforePushToTemp afterPushToTemp rowIndexWrite |
			column := columnBlockContext tempNamed: #columnIndex.
			(composer hasGroup: #newRow)
				ifTrue: [ composer removeGroup: #newRow ].
			(composer hasGroup: #tempList)
				ifTrue: [ self updateRowWith: tempList rowIndex: column ]
				ifFalse: [ LinkedDataVisualizer on: tempList withView: composer view.
					composer group: #tempList ].
			rowIndexWrite := (TempVarConfig
				block: [ :rowInd | row := rowInd ]
				instance: (operands at: #source)
				methodName: operation 
				tempVarName: #index
				when: {#after . #write})
				selfValue;
				getLink.
			beforePushToTemp := (MethodConfig
				block: [ composer
						selectUsing:
							[ :viewEl | viewEl source = ((operands at: #left) at: row at: column) ]
						inGroup: #source ]
				instance: tempList
				methodName: #addLast:
				control: #before) getLink.
			afterPushToTemp := (MethodConfig
				block: [ self updateRowWith: tempList rowIndex: column.
					composer
						deselectUsing:
							[ :viewEl | viewEl source = ((operands at: #left) at: row at: column) ]
						inGroup: #source ]
				instance: tempList
				methodName: #addLast:
				control: #after) getLink.
			self
				addLinks:
					{rowIndexWrite.
					beforePushToTemp.
					afterPushToTemp} ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #tempList
		when: {#after . #write})
		arguments: #(value context);
		selector: #value:value:) .
		MethodConfig block: [ "remove templist and caption"
			composer removeGroup: #sourceMarker.
			composer removeGroup: #tempList.
			namedGroups := namedGroups copyWithout: #sourceMarker.
			composer view canvas focusOnCenterScaled 
			 ] instance: (operands at: #source) methodName: operation control: #after}