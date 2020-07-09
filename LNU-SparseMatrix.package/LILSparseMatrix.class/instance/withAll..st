instance creation
withAll: aCollection
	1 to: rows size
		do: [ :row | 
			(((1 to: (aCollection at: row) size)
				collect: [ :column | 
					(((aCollection at: row) at: column) = 0
						or: [ ((aCollection at: row) at: column) isNil ])
						ifFalse: [ LILSparseMatrixNode
								column: column
								value: ((aCollection at: row) at: column) ] ])
				reject: [ :el | el isNil ])
				do: [ :node | (rows at: row) addLast: node ] ]