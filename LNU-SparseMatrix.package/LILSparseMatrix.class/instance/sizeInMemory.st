memory usage
sizeInMemory 
	| size |
	size := rows inject: 0 into: [ :sum :list | sum + list sizeInMemory ].
	^ super sizeInMemory + size