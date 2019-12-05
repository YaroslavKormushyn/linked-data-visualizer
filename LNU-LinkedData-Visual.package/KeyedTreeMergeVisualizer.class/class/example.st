example
example 
|kt1 kt2|
kt1 := KeyedTree new
		at: 1 put: 'One';
		at: 2 put: 'Two';
		at: 'Tree'
			put:
			(KeyedTree new
				at: $a put: 'Tree-A';
				at: $b put: 'Tree-B';
				yourself);
		yourself.
	kt2 := KeyedTree new
		at: 3 put: 'Three';
		at: 'Tree'
			put:
			(KeyedTree new
				at: $a put: 'Tree-C';
				yourself);
		yourself.
		
	^ LinkedDataOperationVizualizer show: #merge: on: kt1 with: kt2