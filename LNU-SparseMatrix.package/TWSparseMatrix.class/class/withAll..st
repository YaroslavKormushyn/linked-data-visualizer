instance creation
withAll: aCollection
	^ (TWSparseMatrix new
		rows: (aCollection size) 
		columns: ((aCollection 
			detectMax: [ :array | array size ]) size))
	   withAll: aCollection