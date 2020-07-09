instance creation
on: aLILSparseMatrix withView: aView
	(aLILSparseMatrix isMemberOf: LILSparseMatrix)
		ifFalse: [ Error
				signal: 'Matrix should be of class ' , LILSparseMatrix className ].
	^ (self new withView: aView) on: aLILSparseMatrix