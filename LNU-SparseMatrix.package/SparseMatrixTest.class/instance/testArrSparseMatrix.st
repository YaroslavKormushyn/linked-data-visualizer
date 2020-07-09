tests
testArrSparseMatrix
		| matrix matrix2 matrix3 |
	matrix := ArrayOfArrays rows: rows columns: columns element: 0.
	matrix2 := ArrayOfArrays rows: rows columns: columns element: 0.
	
	Transcript show: 'Array of Arrays Matrix Testing:'; cr;
			    show: 'Size is ', rows asString, '*', columns asString; cr;
			show: 'Density is ', density asString;cr;
			    show: 'Time to set: ';
			    show: 
		[1 to: rows * columns * density do: [ :index | 
			matrix 
				at: (rand nextInt: rows)
				at: (rand nextInt: columns) 
				put: ((rand next < 0.5) 
					ifTrue: 1 
					ifFalse: -1).
			matrix2 
				at: (rand nextInt: rows)
				at: (rand nextInt: columns) 
				put: ((rand next < 0.5) 
					ifTrue: 1 
					ifFalse: -1)]
		] timeToRun asMilliSeconds asString, ' ms'; cr.
	
	Transcript show: 'Time to add: ';
				show: [ matrix + matrix2 ] timeToRun asMilliSeconds asString, ' ms'; cr.
				
	Transcript show: 'Time to multiply (by number): ';
				show: [ matrix * factor ] timeToRun asMilliSeconds asString, ' ms'; cr.
	
	Transcript show: 'Transposition: ';
				show: [matrix3 := matrix2 transpose] timeToRun asMilliSeconds asString, ' ms'; cr.
	Transcript show: 'Time to multiply (by matrix): ';
				show: [ matrix * matrix3 ] timeToRun asMilliSeconds asString, ' ms'; cr; cr;
	show: 'Size in memory: ';
		cr;
		show: 'First matrix - ';
		show: matrix sizeInMemory;
		cr;
		show: 'Second matrix - ';
		show: matrix2 sizeInMemory;
		cr;cr;cr