I represent the base class for visualizing operations on linked data structures.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.
I act as the entrance point for visualizing operations, so you don't have to know the exact type of a visualizer to display something.

I use Roassal2 and its main components like RTComposer for composing view outputs.
I use LinkedDataVisualizer to display operands.

Public API and Key Messages

- show: on:
- show: on: with: 

You shouldn't create my instances. Use any of my public APIs to visualize operations.
If you need additional output or a specific output for an operation on some structure types - inherit from my children and define your logic.

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

    Instance Variables
	backgroundGroups:		<Array[Symbol]>
	composer:		<RTComposer>
	dataVisualizers:		<Dictionary[LinkedDataVisualizer]>
	delay:		<Delay>
	linkMessageConfigs:		<Object>
	linkTypeDictionary:		<Object>
	metaLinks:		<OrderedCollection[MetaLink]>
	namedGroups:		<Array[Symbol]>
	operands:		<Dictionary>
	operation:		<Symbol>
	operationBlock:		<BlockClosure>
	process:		<Process>
	semaphore:		<Semaphore>


    Implementation Points