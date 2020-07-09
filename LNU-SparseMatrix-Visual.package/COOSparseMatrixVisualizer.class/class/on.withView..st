instance creation
on: aCOOSparseMatrix withView: aView
	(aCOOSparseMatrix isKindOf: COOSparseMatrix)
		ifFalse: [ Error
				signal: 'Matrix should be of class ' , COOSparseMatrix className ].
	^ (self new withView: aView) on: aCOOSparseMatrix