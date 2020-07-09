instance creation
withAll: aCollection
	^ (LILSparseMatrix new 
		rows: (aCollection size) 
		columns: ((aCollection 
			detectMax: [ :array | array size ]) size))
	   withAll: aCollection