I represent a base class for metalinking configurations used in LinkedDataVisualizer.

I can generate metalinks based on the stored configuration, which are already linked.

I use the Reflectivity package to set links to nodes.

Public API and Key Messages

- block: control: instance: when:   
- block: control: instance: when: selector: arguments:

To create an instance of me use my descendants.

Internal Representation and Key Implementation Points.

    Instance Variables
	arguments:		<OrderedCollection>
	block:		<BlockClosure>
	control:		<Symbol>
	instance:		<Object>
	linkOptionsConfigBlocks:		OrderedCollection[BlockClosure]
	operControls:		<OrderedCollection>
	selector:		<Symbol>
	varControls:		<OrderedCollection>
	when:		<Symbol>


    Implementation Points
	arguments -> for block
	block -> should accept the set number of arguments, e.g. one arg if selfValue was called
	control -> could be any of operControls
	instance -> to which the link links
	linkOptionsConfigBlocks -> blocks which accept the link as an argument and change its options
	selector -> message which is sent to block
	when -> any of varControls