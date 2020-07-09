transformation
transpose
	| result tempList index columnI rowI mark tempMark|
	result := self class rows: columnNumber columns: rowNumber.
	1 to: columnNumber do: [ :columnIndex | 
		columnI := columnIndex.
		tempList := LinkedList new.
		1 to: rowNumber do: [ :rowIndex | 
			rowI := rowIndex.
			(self rows at: rowIndex) isEmpty
				ifFalse: [ (self rows at: rowIndex) first
						ifNotNil: [ index := (self rows at: rowIndex)
								findFirst: [ :element | element column = columnIndex ].
							index = 0
								ifFalse: [ tempList
										addLast:
											(LILSparseMatrixNode
												column: rowIndex
												value: ((self rows at: rowIndex) at: index) value).
												tempMark := 1 ] ] ] ].
		result rows at: columnIndex put: tempList.
		mark := 1 ].
	^ result