tests
testCOOSparseMatrix
	| coo coo2 coo3 |
	coo := COOSparseMatrix rows: rows columns: columns.
	coo2 := COOSparseMatrix rows: rows columns: columns.
	Transcript
		show: 'COOSparseMatrix Testing:';
		cr;
		show: 'Size is ', rows asString, '*', columns asString; cr;
		show: 'Density is ', density asString;cr;
		show: 'Time to set: ';
		show:
			[ 1 to: rows * columns *density do: [ :index | 
				coo
					at: (rand nextInt: rows)
					at: (rand nextInt: columns)
					put:
						(rand next < 0.5
							ifTrue: 1
							ifFalse: -1).
				coo2
					at: (rand nextInt: rows)
					at: (rand nextInt: columns)
					put:
						(rand next < 0.5
							ifTrue: 1
							ifFalse: -1) ] ] timeToRun asMilliSeconds asString, ' ms';
		cr.
	Transcript
		show: 'Time to add: ';
		show: [ coo + coo2 ] timeToRun asMilliSeconds asString, ' ms';
		cr.
	Transcript
		show: 'Time to multiply (by number): ';
		show: [ coo * factor ] timeToRun asMilliSeconds asString, ' ms';
		cr.
	
	Transcript show: 'Transposition: ';
				show: [coo3 := coo2 transpose] timeToRun asMilliSeconds asString, ' ms'; cr.
	Transcript
		show: 'Time to multiply (by matrix): ';
		show: [ coo *  coo3 ] timeToRun asMilliSeconds asString, ' ms';
		cr;
		cr.
	Transcript
		show: 'Size in memory: ';
		cr;
		show: 'First matrix - ';
		show: coo sizeInMemory;
		cr;
		show: 'Second matrix - ';
		show: coo2 sizeInMemory;
		cr;cr;cr