I represent the base class for visualizing binary merge operations on linked data structures.

Don't use me directly, better use show:on:with: of LinkedDataOperationVisualizer.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands. 

Public API and Key Messages

- show: on: with: 

You shouldn't create my instances. Use any of my public APIs to visualize operations.
If you need additional output or a specific output for addition on some structure types - inherit from me and define your logic.

Visualization example:
	kt1 := KeyedTree new
		at: 1 put: 'One';
		at: 2 put: 'Two';
		at: 'Tree'
			put:
			(KeyedTree new
				at: $a put: 'Tree-A';
				at: $b put: 'Tree-B';
				yourself);
		yourself.
	kt2 := KeyedTree new
		at: 3 put: 'Three';
		at: 'Tree'
			put:
			(KeyedTree new
				at: $a put: 'Tree-C';
				yourself);
		yourself.
	LinkedDataOperationVizualizer show: #merge: on: kt1 with: kt2

Internal Representation and Key Implementation Points.

    Implementation Points

	I use the class side show:on:with: as a detection mechanism for searching type-specific merge operation visualizers.
	Don't touch!
	
	If you have a merge operation activated by some other message than my class-side permittedOperations returns - just add that to the return value.