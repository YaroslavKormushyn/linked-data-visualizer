I represent a sparse matrix of numbers.

I store a low-density table of numbers. l know my dimensions.

My main collaborator is LILSparseMatrixNode, which is the internal representaion of my elements.

Public API and Key Messages
- columnNumber
- rowNumber
- at: at:
- at:at:put:

Instance creation:
1) An empty matrix of size number_of_rows x number_of_columns
- LILSparseMatrix rows: number_of_rows columns: number_of_columns
2) Matrix of size 2x2
			[ 1 0 ]
			[ 2 0 ]
- LILSparseMatrix withAll: { { 1 . 0 } . { 2 . 0 } }
   
Internal Representation and Key Implementation Points.

    Instance Variables
	columnNumber:		<SmallInteger>
	rowNumber:			<SmallInteger>
	rows:				<Array>

    Implementation Points
I store my rows as elements of kind LinkedList in instance variable 'rows'.