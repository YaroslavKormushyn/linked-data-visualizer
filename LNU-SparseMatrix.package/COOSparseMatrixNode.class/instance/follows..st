relative position
follows: aCOOMatrixNode
	^ (row > aCOOMatrixNode row) | ((row = aCOOMatrixNode row) & (column > aCOOMatrixNode column))