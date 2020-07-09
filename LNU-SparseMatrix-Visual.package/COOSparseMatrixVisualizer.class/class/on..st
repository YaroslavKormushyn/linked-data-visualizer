instance creation
on: aCOOSparseMatrix
	(aCOOSparseMatrix isMemberOf: COOSparseMatrix)
		ifFalse: [ Error signal: 'Matrix should be of class ' , COOSparseMatrix className ].
	^ self new on: aCOOSparseMatrix