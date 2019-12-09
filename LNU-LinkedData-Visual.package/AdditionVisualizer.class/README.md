I represent the base class for visualizing binary additions on linked data structures.

Don't use me directly, better use show:on:with: of LinkedDataOperationVisualizer.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands. 

Public API and Key Messages

- show: on: with: 

You shouldn't create my instances. Use any of my public APIs to visualize operations.
If you need additional output or a specific output for addition on some structure types - inherit from me and define your logic.

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

Internal Representation and Key Implementation Points.

    Implementation Points

	I use the class side show:on:with: as a detection mechanism for searching type-specific addition operation visualizers.
	Don't touch!