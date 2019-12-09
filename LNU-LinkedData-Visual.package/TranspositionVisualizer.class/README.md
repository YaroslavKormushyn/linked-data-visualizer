I represent the base class for visualizing unary transposition operations on linked data structures.

Don't use me directly, better use show:on: of LinkedDataOperationVisualizer.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands. 

Public API and Key Messages

- show: on: 

You shouldn't create my instances. Use any of my public APIs to visualize operations.
If you need additional output or a specific output for transposition on some structure types - inherit from me and define your logic.

Visualization example:
	col := {{1 . -1 . 0 . 0}.
	{0 . 3 . 0 . 0}.
	{1 . 0 . 2 . 1}.
	{0 . 0 . 0 . 0}}.
	lil := LILSparseMatrix withAll: col.
	LinkedDataOperationVizualizer show: #transpose on: lil

Internal Representation and Key Implementation Points.

    Implementation Points

	I use the class side show:on:with: as a detection mechanism for searching type-specific transposition operation visualizers.
	Don't touch!
	
	If you have a transposition operation activated by some other message than my class-side permittedOperations returns - just add that to the return value.