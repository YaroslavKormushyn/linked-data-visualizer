I represent a class for metalinking configurations used in LinkedDataVisualizer to link to instance variables (slots).

I can generate metalinks based on the stored configuration, which are already linked.

I use the Reflectivity package to set links to nodes.

Public API and Key Messages

- block: control: instance: slotName: when:  
- block: control: instance: slotName: when: selector:
- block: control: instance: slotName: when: selector: arguments: 

To create an instance:
	SlotLinkConfig block: [ Transcript show: 'Hello from slot link!']
							control: #after instance: variable slotName: classVar when: #write

Internal Representation and Key Implementation Points.

    Instance Variables
	arguments:		<OrderedCollection>
	block:		<BlockClosure>
	slotName: <Symbol>
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
	slotName -> slot name
	control -> could be any of operControls
	instance -> to which the link links
	linkOptionsConfigBlocks -> blocks which accept the link as an argument and change its options
	selector -> message which is sent to block
	when -> any of varControls