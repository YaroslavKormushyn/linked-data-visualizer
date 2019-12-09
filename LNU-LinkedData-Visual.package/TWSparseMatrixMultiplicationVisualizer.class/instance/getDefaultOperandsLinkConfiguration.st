as yet unclassified
getDefaultOperandsLinkConfiguration
	^ {(TempVarConfig
		block: [ :rowNums | 
			"grey out empty rows"
			| emptyRowIndexes rowNumsDo |
			emptyRowIndexes := (1 to: (operands at: #left) rowNumber)
				copyWithoutAll: rowNums.
			emptyRowIndexes
				do: [ :ri | 
					| backgroundBoxLeft backgroundBoxResult outterGap |
					outterGap := 5 @ 5.
					backgroundBoxLeft := TRRoundedBoxShape new.
					backgroundBoxLeft color: (Color gray alpha: 0.5).
					backgroundBoxLeft strokeWidth: 0.
					backgroundBoxLeft borderRadius: 5.
					backgroundBoxLeft
						translateTo:
							(composer getGroup: #left) center x
								@
									(composer view elementFromModel: ((operands at: #left) rows at: ri))
										center y.
					backgroundBoxLeft
						extent:
							(composer getGroup: #left) extent x
								@
									(composer view elementFromModel: ((operands at: #left) rows at: ri))
										extent y + outterGap.
					backgroundBoxResult := TRRoundedBoxShape new.
					backgroundBoxResult color: (Color gray alpha: 0.5).
					backgroundBoxResult strokeWidth: 0.
					backgroundBoxResult borderRadius: 5.
					backgroundBoxResult
						translateTo:
							(composer getGroup: #result) center x
								@
									(composer view elementFromModel: ((operands at: #result) rows at: ri))
										center y.
					backgroundBoxResult
						extent:
							(composer getGroup: #result) extent x
								@
									(composer view elementFromModel: ((operands at: #result) rows at: ri))
										extent y + outterGap.
					composer view canvas addShape: backgroundBoxLeft.
					composer view canvas addShape: backgroundBoxResult.
					(composer hasGroup: #shade)
						ifTrue: [ composer groupToExisting: #shade ]
						ifFalse: [ composer group: #shade ] ].
			"bind to row numbers do: to extract the row index from block invocation"
			rowNumsDo := (MethodConfig
				block: [ :args | 
					| rowBlockInvocation |
					rowBlockInvocation := (MethodConfig
						block: [ :curRowI | 
							currentRowIndex := curRowI first.
							nowProcessingLabelElement
								model: currentRowIndex @ currentColIndex.
							nowProcessingLabelElement update.
							delay copy wait ]
						instance: args first
						methodName: #value:
						control: #before)
						selector: #value:;
						arguments: #(arguments);
						getLink ]
				instance: rowNums
				methodName: #do:
				control: #before)
				selector: #value:;
				arguments: #(arguments);
				getLink ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #rowNumbers
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ :colNums | 
			"grey out empty cols"
			| emptyColIndexes colNumsDo |
			"self halt."
			emptyColIndexes := (1 to: (operands at: #right) columnNumber)
				copyWithoutAll: colNums.
			emptyColIndexes
				do: [ :ci | 
					| backgroundBoxRight backgroundBoxResult outterGap |
					outterGap := 5 @ 5.
					backgroundBoxRight := TRRoundedBoxShape new.
					backgroundBoxRight color: (Color gray alpha: 0.5).
					backgroundBoxRight strokeWidth: 0.
					backgroundBoxRight borderRadius: 5.
					backgroundBoxRight
						translateTo:
							(composer view
								elementFromModel: ((operands at: #right) columns at: ci))
								center x @ (composer getGroup: #right) center y.
					backgroundBoxRight
						extent:
							(composer view
								elementFromModel: ((operands at: #right) columns at: ci))
								extent x @ (composer getGroup: #right) extent y + outterGap.
					backgroundBoxResult := TRRoundedBoxShape new.
					backgroundBoxResult color: (Color gray alpha: 0.5).
					backgroundBoxResult strokeWidth: 0.
					backgroundBoxResult borderRadius: 5.
					backgroundBoxResult
						translateTo:
							(composer view
								elementFromModel: ((operands at: #result) columns at: ci))
								center x @ (composer getGroup: #result) center y.
					backgroundBoxResult
						extent:
							(composer view
								elementFromModel: ((operands at: #result) columns at: ci))
								extent x @ (composer getGroup: #result) extent y + outterGap.
					composer view canvas addShape: backgroundBoxRight.
					composer view canvas addShape: backgroundBoxResult.
					(composer hasGroup: #shade)
						ifTrue: [ composer groupToExisting: #shade ]
						ifFalse: [ composer group: #shade ] ].
			"bind to column numbers do: to extract the column index from block invocation"
			colNumsDo := (MethodConfig
				block: [ :args | 
					| colBlockInvocation |
					colBlockInvocation := (MethodConfig
						block: [ :curColI | 
							currentColIndex := curColI first.
							nowProcessingLabelElement
								model: currentRowIndex @ currentColIndex.
							nowProcessingLabelElement update.
							delay copy wait ]
						instance: args first
						methodName: #value:
						control: #before)
						selector: #value:;
						arguments: #(arguments);
						getLink ]
				instance: colNums
				methodName: #do:
				control: #before)
				selector: #value:;
				arguments: #(arguments);
				getLink ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #columnNumbers
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ :leftMarkerReif | 
			leftMarkerReif
				ifNotNil: [ leftMarkerElement updateModelAndRedraw: leftMarkerReif.
					delay copy wait.
					leftMarkerReif column ~= 0
						ifTrue: [ composer selectModel: leftMarkerReif inGroup: #left.
							delay copy wait ] ] ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #leftMarker
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ :leftMarkerReif | 
			leftMarkerReif
				ifNotNil: [ leftMarkerReif column ~= 0
						ifTrue: [ composer deselectModel: leftMarkerReif inGroup: #left ] ] ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #leftMarker
		when: {#before . #write}) selfValue.
	(TempVarConfig
		block: [ :rightMarkerReif | 
			rightMarkerReif
				ifNotNil: [ rightMarkerElement updateModelAndRedraw: rightMarkerReif.
					delay copy wait.
					rightMarkerReif row ~= 0
						ifTrue: [ composer selectModel: rightMarkerReif inGroup: #right.
							delay copy wait ] ] ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #rightMarker
		when: {#after . #write}) selfValue.
	(TempVarConfig
		block: [ :rightMarkerReif | 
			rightMarkerReif
				ifNotNil: [ rightMarkerReif row ~= 0
						ifTrue: [ composer deselectModel: rightMarkerReif inGroup: #right ] ] ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #rightMarker
		when: {#before . #write}) selfValue.
	(TempVarConfig
		block: [ composer highlightModel: leftMarkerElement model inGroup: #left.
			composer highlightModel: rightMarkerElement model inGroup: #right.
			delay copy wait ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #highlightMarker
		when: {#before . #write}).
	(TempVarConfig
		block: [ :sumVal | 
			newElementValueLabelElement model: sumVal.
			newElementValueLabelElement update.
			delay copy wait ]
		instance: (operands at: #left)
		methodName: operation
		tempVarName: #sum
		when: {#after . #write}) selfValue}