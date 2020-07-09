instance creation
onRow: aLILSparseMatrixRow withView: aView
	(aLILSparseMatrixRow isKindOf: LinkedList)
		ifFalse: [ Error
				signal: 'Matrix row should be of class ' , LinkedList className ].
	^ (self new withView: aView) on: aLILSparseMatrixRow