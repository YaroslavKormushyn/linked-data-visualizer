I represent a type-specific class for visualizing binary merge operations on KeyedTree.

Don't use me directly, better use show:on:with: of LinkedDataOperationVisualizer.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands. 

Public API and Key Messages

- show: on: with: 

You shouldn't create my instances. Use any of my public APIs to visualize operations.

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