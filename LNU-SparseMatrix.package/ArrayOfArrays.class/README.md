I represent a matrix of numbers.

I store a table of numbers. l know my size.

My main collaborator is Array, which is the internal representaion of my rows.

Public API and Key Messages
- columnNumber
- rowNumber
- at: at:
- at:at:put:
- removeAt:at:
- transpose
- copy
- withAll:

Instance creation:
1) An empty matrix of size [ number_of_rows x number_of_columns ]
- ArrayOfArrays rows: number_of_rows columns: number_of_columns
2) Matrix of size 2x2
			[ 1 0 ]
			[ 2 0 ]
- ArrayOfArrays withAll: { { 1 . 0 } . { 2 . 0 } }
   
Internal Representation and Key Implementation Points.

    Instance Variables
	columnNumber:		<SmallInteger>
	rowNumber:			<SmallInteger>
	rows:				<Array>