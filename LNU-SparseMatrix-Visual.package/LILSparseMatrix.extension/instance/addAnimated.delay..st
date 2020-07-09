*LNU-SparseMatrix-Visual
addAnimated: aLILSparseMatrix delay: delay
	| result rightMatrix arr list operationProcess vis leftMatrixRow rightMatrixRow |
	rowNumber = aLILSparseMatrix rowNumber
		& (columnNumber = aLILSparseMatrix columnNumber)
		ifFalse: [ Error signal: 'Matrices must be of the same size.' ].
	rightMatrix := aLILSparseMatrix copy.
	result := self class rows: rowNumber columns: columnNumber.
	vis := MatrixOperationVisualizer new.
	vis delay: delay.
	vis getComposedViewOf: self with: rightMatrix result: result.
	operationProcess := [ | unionLabel nowProcLabel |
	unionLabel := (RTLabel text: 'U') element.
	vis add: unionLabel.
	vis group: #unionLabel.
	LILSparseMatrixVisualizer onRow: 1 in: self withView: vis view.
	vis group: #leftRow.
	LILSparseMatrixVisualizer onRow: 1 in: rightMatrix withView: vis view.
	vis group: #rightRow.
	nowProcLabel := (RTLabel
		text: [ :col | 'Processing column ' , col asString ]) elementOn: 0.
	vis add: nowProcLabel.
	vis group: #nowProc.
	vis composer move: #leftRow below: #left.
	vis composer move: #rightRow below: #right.
	vis composer move: #unionLabel between: #leftRow and: #rightRow.
	vis composer move: #nowProc below: #unionLabel.
	vis composer nameGroup: #leftRow as: 'leftRow'.
	vis composer nameGroup: #rightRow as: 'rightRow'.
	vis composer groupToExisting: 'labels'.
	vis namedGroups: #(#left #result #right #leftRow #rightRow).
	vis backgroundGroups: #(#left #result #right #leftRow #rightRow).
	vis composer redrawNamesAndBackgroundsFor: vis namedGroups.
	vis group: #labels.
	vis update.
	vis delay wait.
	arr := (1 to: result rowNumber)
		collect: [ :row | 
			| newRowGroup |
			vis composer removeGroup: #leftRow.
			LILSparseMatrixVisualizer onRow: row in: self withView: vis view.
			vis group: #leftRow.
			vis composer removeGroup: #rightRow.
			LILSparseMatrixVisualizer
				onRow: row
				in: rightMatrix
				withView: vis view.
			vis group: #rightRow.
			vis composer move: #leftRow below: #left.
			vis composer move: #rightRow below: #right.
			vis composer move: #unionLabel between: #leftRow and: #rightRow.
			vis composer move: #nowProc below: #unionLabel.
			vis composer redrawNamesAndBackgroundsFor: vis namedGroups.
			vis group: #labels.
			arr := (rows at: row) union: (rightMatrix rows at: row).
			arr := (1 to: columnNumber)
				collect: [ :columnIndex | 
					nowProcLabel model: columnIndex.
					nowProcLabel update.
					vis composer
						deselectUsing: [ :model | model column = (columnIndex - 1) ]
						inGroup: #leftRow.
					vis composer
						deselectUsing: [ :model | model column = (columnIndex - 1) ]
						inGroup: #rightRow.
					vis composer
						selectUsing: [ :model | model column = columnIndex ]
						inGroup: #leftRow.
					vis composer
						selectUsing: [ :model | model column = columnIndex ]
						inGroup: #rightRow.
					vis delay wait.
					LILSparseMatrixNode
						column: columnIndex
						value:
							((arr select: [ :node | node column = columnIndex ])
								inject: 0
								into: [ :sum :element | sum + element value ]) ]
				thenReject: [ :node | node value = 0 ].
			"last column was not deselected"
			vis composer
				deselectUsing: [ :model | model column = columnNumber ]
				inGroup: #leftRow.
			vis composer
				deselectUsing: [ :model | model column = columnNumber ]
				inGroup: #rightRow.
			nowProcLabel model: 'none'.
			nowProcLabel update.
			vis delay wait.
			list := LinkedList new.
			newRowGroup := #newRow , row asString.
			arr
				do: [ :node | 
					list addLast: node.
					(vis composer hasGroup: newRowGroup)
						ifTrue: [ vis composer removeGroup: newRowGroup ].
					LILSparseMatrixVisualizer
						onLinkedList: list
						inRow: row
						withView: vis view.
					vis group: newRowGroup.
					vis composer move: newRowGroup below: #nowProc.
					vis composer redrawNamesFor: vis namedGroups.
					vis composer redrawBackgroundsFor: vis backgroundGroups.
					vis composer view canvas focusOnCenterScaled.
					vis delay wait ].
			list isEmpty
				ifFalse: [ | captionLabel |
					row = 1
						ifTrue: [ vis composer move: newRowGroup onTheRightBelowOf: #result ]
						ifFalse: [ self
								withEscaper: [ :break | 
									(1 to: row - 1) reverse
										detect: [ :rowIndex | vis composer hasGroup: #newRow , rowIndex asString ]
										ifFound: [ :previousRow | 
											vis composer
												move: newRowGroup
												below: #newRow , previousRow asString.
											break value ] ] ].
					captionLabel := (RTLabel
						text: Character arrowLeft asString , 'List for row ' , row asString)
						element.
					vis add: captionLabel.
					vis group: #newRow , row asString , #Caption.
					vis composer
						move: #newRow , row asString , #Caption
						onTheRightOf: newRowGroup ].
			vis composer view canvas focusOnCenterScaled.
			list ].
	vis composer removeGroup: #leftRow.
	vis composer removeGroup: #rightRow.
	vis composer removeGroup: #unionLabel.
	vis composer removeGroup: #nowProc.
	vis
		namedGroups: (vis namedGroups copyWithoutAll: #(#leftRow #rightRow)).
	vis
		backgroundGroups: (vis backgroundGroups copyWithoutAll: #(#leftRow #rightRow)).
	vis redrawNamesAndBackgrounds.
	1 to: result rowNumber do: [ :rowIndex | 
		(vis composer hasGroup: #newRow , rowIndex asString)
			ifTrue: [ vis composer removeGroup: #newRow , rowIndex asString.
				vis composer removeGroup: #newRow , rowIndex asString , #Caption ].
		result rows at: rowIndex put: (arr at: rowIndex).
		vis updateResultWith: result.
		vis composer view canvas focusOnCenterScaled.
		vis delay wait ] ] newProcess.
	vis setUpMenuWithProcess: operationProcess.
	^ vis view