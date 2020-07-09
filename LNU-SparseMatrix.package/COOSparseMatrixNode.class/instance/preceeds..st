relative position
preceeds: aCOOMatrixNode
	^ (row < aCOOMatrixNode row) | ((row = aCOOMatrixNode row) & (column < aCOOMatrixNode column))