instance creation
on: aTWSparseMatrix
	(aTWSparseMatrix isMemberOf: TWSparseMatrix)
		ifFalse: [ Error signal: 'Matrix should be of class ' , TWSparseMatrix className ].
	^ self new on: aTWSparseMatrix