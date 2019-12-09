I represent a class for visualizing a LinkedList.
You don't have to know my name to visualize a list, just use my base class LinkedDataVisualizer and display: or on: method.

I can show a linked list and the links between its elements.
I use Roassal2 and its main components like RTView, TRCanvas, RTEdgeBuilder for displaying output.

Public API and Key Messages

- display:
- display: withView:
- on: withView:

Instance creation:

ll := LinkedList newFrom: { 1 . 2 . 0 . -1 }.
LinkedDataVisualizer display: ll
 
Internal Representation and Key Implementation Points.

   Implementation Points
	I assume that the underlying list elements are matrix nodes, which have a row and column public accessor.
	If you have some other underlying element structure - initialize a new instance of me and set the proper shapes for the #data and #header keys in the shapes dictionary.