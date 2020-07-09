I represent a value wrapper for TWSparseMatrix.

I store values of kind Number, row and column position in a TWSparseMatrix, right and below neighbour.

I'm used by TWSparseMatrix for storing values.

Public API and Key Messages

- column  
- row 
- value 
- value:row:column:
- rightNeighbour:belowNeighbour:
- copy

Internal Representation and Key Implementation Points.

    Instance Variables
	row:		<SmallInteger>
	column:		<SmallInteger>
	value:		<Number>
	rightNeighbour: <TWMatrixNode>
	belowNeighbour: <TWMatrixNode>

Instance creation:
1) From metaclass:
	TWMatrixNode row:num1 column:num2 value: num3
OR
	TWMatrixNode new: num1 atRow: num2 atColumn: num3