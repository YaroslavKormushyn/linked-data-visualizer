tests
testLILSparseMatrix
	| lil lil2 lil3 |
	lil := LILSparseMatrix rows: rows columns: columns.
	lil2 := LILSparseMatrix rows: rows columns: columns.
	
	Transcript show: 'LILSparseMatrix Testing:'; cr;
			    show: 'Size is ', rows asString, '*', columns asString; cr;
			show: 'Density is ', density asString;cr;
			    show: 'Time to set: ';
			    show: 
		[1 to: rows * columns * density do: [ :index | 
			lil 
				at: (rand nextInt: rows) 
				at: (rand nextInt: columns) 
				put: ((rand next < 0.5) 
					ifTrue: 1 
					ifFalse: -1).
			lil2 
				at: (rand nextInt: rows) 
				at: (rand nextInt: columns) 
				put: ((rand next < 0.5) 
					ifTrue: 1 
					ifFalse: -1)]
		] timeToRun asMilliSeconds asString, ' ms' ; cr.
	
	Transcript show: 'Time to add: ';
				show: [ lil + lil2 ] timeToRun  asMilliSeconds asString, ' ms' ; cr.
				
	Transcript show: 'Time to multiply (by number): ';
				show: [ lil * factor ] timeToRun asMilliSeconds asString, ' ms'; cr.
				
	Transcript show: 'Transposition: ';
				show: [lil3 := lil2 transpose] timeToRun asMilliSeconds asString, ' ms'; cr.
	Transcript show: 'Time to multiply (by matrix): ';
				show: [ lil *  lil3 ] timeToRun asMilliSeconds asString, ' ms'; cr; cr.
	Transcript
		show: 'Size in memory: ';
		cr;
		show: 'First matrix - ';
		show: lil sizeInMemory;
		cr;
		show: 'Second matrix - ';
		show: lil2 sizeInMemory;
		cr;cr;cr