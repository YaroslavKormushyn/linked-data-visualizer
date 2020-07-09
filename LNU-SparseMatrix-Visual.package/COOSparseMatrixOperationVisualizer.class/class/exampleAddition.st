as yet unclassified
exampleAddition
|col col2 coo coo2 cooanimvis|
col := { { 1 . -1 . 0 . 0 } . 
	  	   { 0 . 3 . 0 . 0 } . 
	  	   { 1 . 0 . 2 . 1 } . 
		   { 0 . 0 . 0 . 0 } }.
col2 := { { 1 . 0 . 0 . 3 } . 
	  	   { 0 . 0 . 0 . -1 } . 
	  	   { 0 . 0 . 0 . 0 } . 
		   { 0 . 0 . 1 . 0 } }.
		
coo := COOSparseMatrix withAll: col.
coo2 := COOSparseMatrix withAll: col2.

cooanimvis := COOSparseMatrixOperationVisualizer new.
cooanimvis delay: 1.
^ cooanimvis addAnimated: coo to: coo2
