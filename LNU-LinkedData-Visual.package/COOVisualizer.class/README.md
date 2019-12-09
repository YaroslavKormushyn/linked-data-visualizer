I represent a class for visualizing a sparse matrix with COO internal implementation from LNU-SparseMatrix package.
I act as the end point for visualizing COO sparse matrices. 
You don't need to know my exact type to display, just use my base class.

I can show a COO sparse matrix and the links between its elements.
I know of the elements of the matrix and the links between them.

I use Roassal2 and its main components like RTView, TRCanvas, RTEdgeBuilder for displaying output.

Public API and Key Messages

It's not indended to use me directly, so I don't have a public API.

Internal Representation and Key Implementation Points.

   Implementation Points
	I assume that the structure you want to display is of type COOSparseMatrix.