copying
copy
	| copy |
	copy := self class rows: rowNumber columns: columnNumber.
	1 to: copy rows size do: [ :row | 
		copy rows at: row put: (
			(self rows at: row) 
			collect: [ :node | LILSparseMatrixNode 
								column: node column 
								value: node value ] 
			as: LinkedList) ].
	^ copy