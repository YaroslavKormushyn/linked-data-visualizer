I represent a value wrapper for COOSparseMatrix.

I store values of kind Number, row and column position in a COOSparseMatrix, my left and right neighbour.

I'm used by COOSparseMatrix for storing values.

Public API and Key Messages

- column   
- row 
- value
- leftNeighbour 
- rightNeighbour

Instance creation:
1) From metaclass (with or without value):
	COOMatrixNode row: num1 column: num2 [value: num3]
	
Internal Representation and Key Implementation Points.

    Instance Variables
	column:				<SmallInteger>
	leftNeighbour:		<COOMatrixNode>
	rightNeighbour:		<COOMatrixNode>
	row:				<SmallInteger>
	value:				<SmallInteger>