private
byMatrix: aLILSparseMatrix
	| result other index sum list arr cachedLeftRow cachedRightColumn |
	columnNumber = aLILSparseMatrix rowNumber
		ifFalse: [ Error signal: 'Invalid matrix sizes' ].
	(aLILSparseMatrix isEmpty or: [ self isEmpty ])
		ifTrue:
			[ ^ self class rows: rowNumber columns: aLILSparseMatrix columnNumber ].
	other := aLILSparseMatrix transpose.
	result := self class
		rows: rowNumber
		columns: aLILSparseMatrix columnNumber.
	arr := (1 to: result rowNumber)
		collect: [ :rowIndex | 
			list := LinkedList with: LILSparseMatrixNode new.
			cachedLeftRow := rows at: rowIndex.
			1 to: result columnNumber do: [ :columnIndex | 
				cachedRightColumn := other rows at: columnIndex.
				sum := (cachedLeftRow
					collect: [ :leftNode | 
						index := cachedRightColumn
							findFirst: [ :rightNode | rightNode column = leftNode column ].
						index = 0
							ifFalse: [ leftNode value * (cachedRightColumn at: index) value ] ]
					thenReject: [ :el | el isNil ]) detectSum: [ :each | each ].
				sum = 0
					ifFalse: [ list addLast: (LILSparseMatrixNode column: columnIndex value: sum).
						sum := 0 ] ].
			list ].
	arr keysAndValuesDo: [ :i :li | result rows at: i put: li copyWithoutFirst].
	^ result