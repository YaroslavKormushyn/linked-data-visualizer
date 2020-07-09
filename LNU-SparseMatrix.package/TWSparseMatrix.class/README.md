I represent a sparse matrix of numbers.

I can be multiplied with other matrices, added to other matrices, multiplied by a number, transposed.
I store a low-density table of numbers. l know my dimensions.

My main collaborator is TWMatrixNode, which is the internal representaion of my elements.

Public API and Key Messages
- columnsNumber
- rowsNumber
- at: at:
- at:at:put:
- removeAt:at:
- copy
- transpose
- isEmpty

Instance creation:
1) An empty matrix of size number_of_rows x number_of_columns
- TWSparseMatrix rows: number_of_rows columns: number_of_columns
2) Matrix of size 2x2
			[ 1 0 ]
			[ 2 0 ]
- LILSparseMatrix withAll: { { 1 . 0 } . { 2 . 0 } }
   
    Instance Variables
	columnsNumber:		<SmallInteger>
	rowsNumber:		<SmallInteger>
	rows:				<Array>
	columns:			<Array>
