I represent a value wrapper for LILSparseMatrix.

I store values of kind Number, column position in a LILSparseMatrix.

I'm used by LILSparseMatrix for storing values.

Public API and Key Messages

- column   
- value 
- column:value:

Internal Representation and Key Implementation Points.

    Instance Variables
	column:		<SmallIInteger>
	value:		<Number>


Instance creation:
1) From metaclass:
	LILMatrixNode column:num1 value: num2