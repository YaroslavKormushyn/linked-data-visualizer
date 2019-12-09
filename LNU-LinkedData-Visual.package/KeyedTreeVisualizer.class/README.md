I represent a class for visualizing a KeyedTree structure.
You don't have to know my name to display a keyed tree, just use my base class LinkedDataVisualizer.

I can show a KeyedTree structure given the right initialization.
I use Roassal2 and its main components like RTView, TRCanvas, RTEdgeBuilder for displaying output.
I use a KeyedTreeElement wrapper for tree nodes when displaying output.

Public API and Key Messages

- display:
- display: withView:
- on: withView:

Instance creation:

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
	LinkedDataVisualizer display: kt1
 
Internal Representation and Key Implementation Points.

   Implementation Points
	I assume that the structure you want to display is of type KeyedTree.