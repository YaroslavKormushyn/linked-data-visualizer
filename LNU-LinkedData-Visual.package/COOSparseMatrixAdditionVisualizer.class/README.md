I represent a type-specific class for visualizing binary additions on COOSparseMatrix.

Don't use me directly, better use show:on:with: of LinkedDataOperationVisualizer.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands. 

Public API and Key Messages

- show: on: with: 

You shouldn't create my instances. Use any of my public APIs to visualize operations.

Visualization example:

col := {{1 . -1 . 0 . 0}.
	{0 . 3 . 0 . 0}.
	{1 . 0 . 2 . 1}.
	{0 . 0 . 0 . 0}}.
	col2 := {{1 . 0 . 0 . 3}.
	{0 . 0 . 0 . -1}.
	{0 . 0 . 0 . 0}.
	{0 . 0 . 1 . 0}}.
	coo := COOSparseMatrix withAll: col.
	coo2 := COOSparseMatrix withAll: col2.
	LinkedDataOperationVizualizer show: #+ on: coo with: coo2