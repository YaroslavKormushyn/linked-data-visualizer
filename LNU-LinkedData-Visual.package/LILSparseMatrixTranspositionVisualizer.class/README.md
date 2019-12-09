I represent a type-specific class for visualizing unary transposition operations on LILSparseMatrix.

Don't use me directly, better use show:on: of LinkedDataOperationVisualizer.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands. 

Public API and Key Messages

- show: on: 

You shouldn't create my instances. Use any of my public APIs to visualize operations.

Visualization example:

	col := {{1 . -1 . 0 . 0}.
			  {0 . 3 . 0 . 0}.
			  {1 . 0 . 2 . 1}.
			  {0 . 0 . 0 . 0}}.
	lil := LILSparseMatrix withAll: col.
	LinkedDataOperationVizualizer show: #transpose on: lil