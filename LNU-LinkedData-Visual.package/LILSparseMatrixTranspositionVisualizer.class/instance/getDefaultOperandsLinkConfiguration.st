as yet unclassified
getDefaultOperandsLinkConfiguration
	^ {(TempVarConfig
		block: [ :temp | 
			| afterPushToTemp |
			operands at: #t put: temp.
			"(composer hasGroup: #newRow)
				ifTrue: [ composer removeGroup: #newRow ]."
			(composer hasGroup: #tempList)
				ifTrue: [ self updateRowWith: temp rowIndex: currentColumnIndex ]
				ifFalse: [ "afterPushToTemp := (MethodConfig
				block: [ Transcript
						show: 'do I update temp list?';
						cr.
					self updateRowWith: temp rowIndex: currentColumnIndex ]
				instance: temp
				methodName: #addLast:
				control: #after) getLink.
			self addLink: afterPushToTemp.
			delay copy wait"
					LinkedDataVisualizer on: temp withView: composer view.
					composer group: #tempList.
					composer view add: tempListLabelElement.
					composer group: #tempListLabel.
					Transcript
						show: 'made tempList';
						cr ] ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #tempList
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ Transcript
				show: 'update temp list';
				cr.
			self updateRowWith: (operands at: #t) rowIndex: currentColumnIndex.
			delay copy wait ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #tempMark
		when: {#after . #write}).
	(TempVarConfig
		block: [ :colI | 
			Transcript
				show: 'update col ind ' , colI asString;
				cr.
			currentColumnIndex := colI ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #columnI
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ :rI | 
			Transcript
				show: 'update row ind ' , rI asString;
				cr.
			currentRowIndex := rI ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #rowI
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ :foundColumnIndex | 
			Transcript
				show: 'write to index ' , foundColumnIndex asString;
				cr.
			foundColumnIndex = 0
				ifTrue: [ sourceMarkerElement
						updateModelAndRedraw: (MatrixElement row: 0 column: 0 value: nil) ]
				ifFalse: [ | elVal newModel |
					Transcript
						show:
							'after write to index get '
								, (currentRowIndex @ foundColumnIndex) asString;
						cr.
					elVal := (operands at: #source)
						at: currentRowIndex
						at: currentColumnIndex.
					newModel := MatrixElement
						row: currentRowIndex
						column: currentColumnIndex
						value: elVal.
					sourceMarkerElement updateModelAndRedraw: newModel.
					composer
						selectUsing: [ :el | el row = newModel row & (el column = newModel column) ]
						inGroup: #source.
					delay copy wait.
					composer
						deselectUsing: [ :el | el row = newModel row & (el column = newModel column) ]
						inGroup: #source ] ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #index
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ Transcript
				show: 'update result';
				cr.
			self updateResultWith: (operands at: #result) ]
		instance: (operands at: #source)
		methodName: operation
		tempVarName: #mark
		when: {#after . #write}).
	(MethodConfig
		block: [ "remove templist and caption"
			Transcript
				show: 'remove temps';
				cr.
			composer removeGroup: #sourceMarker.
			composer removeGroup: #tempListLabel.
			composer removeGroup: #tempList.
			namedGroups := namedGroups copyWithout: #sourceMarker.
			composer redrawNamesFor: namedGroups.
			composer redrawBackgroundsFor: backgroundGroups.
			composer view canvas focusOnCenterScaled ]
		instance: (operands at: #source)
		methodName: operation
		control: #after)}