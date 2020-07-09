tests
testTWSparseMatrix
	| tw tw2 tw3 |
	tw := TWSparseMatrix rows: rows columns: columns.
	tw2 := TWSparseMatrix rows: rows columns: columns.
	Transcript
		show: 'TWSparseMatrix Testing:';
		cr;
		show: 'Size is ' , rows asString , '*' , columns asString;
		cr;
		show: 'Density is ' , density asString;
		cr;
		show: 'Time to set: ';
		show:
			[ 1 to: rows * columns * density do: [ :index | 
				tw
					at: (rand nextInt: rows)
					at: (rand nextInt: columns)
					put:
						(rand next < 0.5
							ifTrue: 1
							ifFalse: -1).
				tw2
					at: (rand nextInt: rows)
					at: (rand nextInt: columns)
					put:
						(rand next < 0.5
							ifTrue: 1
							ifFalse: -1) ] ] timeToRun asMilliSeconds asString , ' ms';
		cr.
	Transcript
		show: 'Time to add: ';
		show: [ tw + tw2 ] timeToRun asMilliSeconds asString , ' ms';
		cr.
	Transcript
		show: 'Time to multiply (by number): ';
		show: [ tw * factor ] timeToRun asMilliSeconds asString , ' ms';
		cr.
	Transcript
		show: 'Transposition: ';
		show: [ tw3 := tw2 transpose ] timeToRun asMilliSeconds asString , ' ms';
		cr.
	Transcript
		show: 'Time to multiply (by matrix): ';
		show: [ tw * tw3 ] timeToRun asMilliSeconds asString , ' ms';
		cr;
		cr.
	Transcript
		show: 'Size in memory: ';
		cr;
		show: 'First matrix - ';
		show: tw sizeInMemory;
		cr;
		show: 'Second matrix - ';
		show: tw2 sizeInMemory;
		cr;
		cr;
		cr