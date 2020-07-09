I represent a sparse matrix of numbers.

I store a low-density table of numbers. l know my size, first and last element in the table as a sequence of rows left to right.

My main collaborator is COOMatrixNode, which is the internal representaion of my elements.

Public API and Key Messages
- columnNumbers
- rowNumbers
- at: at:
- at:at:put:
- copy
- removeAt:at:
- transpose
- copy
- withAll:

Instance creation:
1) An empty matrix of size [ number_of_rows x number_of_columns ]
- COOSparseMatrix rows: number_of_rows columns: number_of_columns
2) Matrix of size 2x2
			[ 1 0 ]
			[ 2 0 ]
- COOSparseMatrix withAll: { { 1 . 0 } . { 2 . 0 } }
   
Internal Representation and Key Implementation Points.

    Instance Variables
	columnNumber:		<SmallInteger>
	rowNumber:			<SmallInteger>
	first:				<COOMatrixNode>
	last:					<COOMatrixNode>

Implementation Points
My internal representation of values is a sorted linked list, each node represented by COOSparseMatrixNode.