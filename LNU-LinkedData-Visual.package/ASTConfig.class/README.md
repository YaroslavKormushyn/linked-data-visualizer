I represent a class for metalinking configurations used in LinkedDataVisualizer to link to AST nodes.

I can generate metalinks based on the stored configuration, which are already linked.

I use the Reflectivity package to set links to nodes.

Public API and Key Messages

- block: control: instance: ast: when:  
- block: control: instance: ast: when: selector: arguments: 

To create an instance:
	ASTConfig block: [ Transcript show: 'Hello from class variable link!']
							control: #after instance: variable ast: (variable class >> #value:) ast statements first when: #write

Internal Representation and Key Implementation Points.

    Instance Variables
	arguments:		<OrderedCollection>
	block:		<BlockClosure>
	ast: <RBProgramNode>
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
	ast -> ast node where to bind the link
	control -> could be any of operControls
	instance -> to which the link links
	linkOptionsConfigBlocks -> blocks which accept the link as an argument and change its options
	selector -> message which is sent to block
	when -> any of varControls