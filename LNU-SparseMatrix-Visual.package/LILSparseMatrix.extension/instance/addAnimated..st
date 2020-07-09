*LNU-SparseMatrix-Visual
addAnimated: aLILSparseMatrix
	| result arr list operationProcess vis composer|
	rowNumber = aLILSparseMatrix rowNumber
		& (columnNumber = aLILSparseMatrix columnNumber)
		ifFalse: [ Error signal: 'Matrices must be of the same size.' ].
	result := self class rows: rowNumber columns: columnNumber.
	vis := MatrixOperationVisualizer new.
	vis delay: 1.
	vis getComposedViewOf: self with: aLILSparseMatrix result: result.
	operationProcess := [  
	arr := (1 to: result rowNumber)
		collect: [ :row | 
			arr := (rows at: row) union: (aLILSparseMatrix rows at: row).
			arr := (1 to: columnNumber)
				collect: [ :columnIndex | 
					LILSparseMatrixNode
						column: columnIndex
						value:
							((arr select: [ :node | node column = columnIndex ])
								inject: 0
								into: [ :sum :element | sum + element value ]) ]
				thenReject: [ :node | node value = 0 ].
			list := LinkedList new.
			arr do: [ :node | list addLast: node ].
			list ].
	1 to: result rowNumber do: [ :rowIndex | result rows at: rowIndex put: (arr at: rowIndex) ].
	]newProcess.
vis setUpMenuWithProcess: operationProcess.
^ vis composer