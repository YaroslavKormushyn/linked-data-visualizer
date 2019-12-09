I represent the base class for visualizing unary operations on linked data structures.

I act as the entrance point for visualizing unary operations, so you don't have to know the exact type of a visualizer to display something.
Don't use me directly, better use show:on: of my parent - LinkedDataOperationVisualizer.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands.

Public API and Key Messages

- show:on:

You shouldn't create my instances. Use any of my public APIs to visualize operations.
If you need additional output or a specific output for an operation on some structure types - inherit from my children and define your logic.

Visualization example:

col := {{1 . -1 . 0 . 0}.
	{0 . 3 . 0 . 0}.
	{1 . 0 . 2 . 1}.
	{0 . 0 . 0 . 0}}.
	lil := LILSparseMatrix withAll: col.
	LinkedDataOperationVizualizer show: #transpose on: lil

Internal Representation and Key Implementation Points.

    Implementation Points

	I use the class side show:on: as a detection mechanism for searching specific unary operation visualizers.
	Don't touch!