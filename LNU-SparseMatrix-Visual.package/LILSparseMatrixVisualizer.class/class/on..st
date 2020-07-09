instance creation
on: aLILSparseMatrix
	(aLILSparseMatrix isMemberOf: LILSparseMatrix)
		ifFalse: [ Error signal: 'Matrix should be of class ' , LILSparseMatrix className ].
	^ self new on: aLILSparseMatrix