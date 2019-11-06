I represent a base class for visualizing a linked data structure.
I act as the entering point for visualizing structures, you don't need to know the exact type of visualizer to display some object.

I can show a linked data structure given the right initialization.
I know of the elements of a given data structure and the links between them.

I use Roassal2 and its main components like RTView, TRCanvas, RTEdgeBuilder for displaying output.

Public API and Key Messages

- display:
- display: withView:
- on: withView:

Instance creation:

col := {{1 . -1 . 0 . 0}.
	{0 . 3 . 0 . 0}.
	{1 . 0 . 2 . 1}.
	{0 . 0 . 0 . 0}}.
	coo := COOSparseMatrix withAll: col.
	LinkedDataVisualizer display: coo
 
Internal Representation and Key Implementation Points.

	 Instance Variables
	gap: <Integer> - gap between elements
	elementSize: <Integer> - data elements size
	colors: <Dictionary<Symbol, Color>> - color dictionary where the key is the element type (e.g. #data or #header)
	shapes: <Dictionary<Symbol, RTShape>> - shape disctionary where the key is the element type (e.g. #data or #header)
	view: <RTView> - view, where the elements will be
	linkMessages: <OrderedCollection[Symbol]> - messages, which will be sent to each of the element in order to discover the links
 
   Implementation Points
	I assume that the structure you want to display has the links embedded into the nodes.
	If you have some other linking logic - feel free to inherit from me and override drawEdgesWith: and setPositionsFor:.