instance creation
on: aTWSparseMatrix withView: aView
	(aTWSparseMatrix isMemberOf: TWSparseMatrix)
		ifFalse: [ Error signal: 'Matrix should be of class ' , TWSparseMatrix className ].
	^ (self new withView: aView) on: aTWSparseMatrix