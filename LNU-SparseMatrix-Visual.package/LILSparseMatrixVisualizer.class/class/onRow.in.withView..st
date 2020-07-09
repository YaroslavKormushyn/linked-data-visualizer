instance creation
onRow: rowIndex in: aLILSparseMatrix withView: aView
	(aLILSparseMatrix isKindOf: LILSparseMatrix)
		ifFalse: [ Error
				signal: 'Matrix should be of class ' , LILSparseMatrix className ].
	^ (self new withView: aView) onRow: rowIndex in:  aLILSparseMatrix