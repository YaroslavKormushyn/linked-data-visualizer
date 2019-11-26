as yet unclassified
getOperandsLinkConfiguration
	| rootConfig associationsConfig assocBlockConfigAfter assocBlockConfigBefore subtreeConfigFirst subtreeConfigSecond subtreeMerge |
	assocBlockConfigAfter := MethodConfig
		block: [ :keyAndValue | 
			Transcript
				show: 'got to assoc block after ' , keyAndValue asString;
				cr.
			keyAndValue second
				ifNotNil: [ composer
						selectUsing: [ :el | el source = keyAndValue second ]
						inGroup: #right.
					delay copy wait ] ]
		control: #after
		instance: (operands at: #right)
		methodName: #value:value:
		selector: #value:
		arguments: #(arguments).
	assocBlockConfigBefore := MethodConfig
		block: [ :keyAndValue | 
			Transcript
				show: 'got to assoc block before ' , keyAndValue asString;
				cr.
			keyAndValue second
				ifNotNil: [ composer
						deselectUsing: [ :el | el source = keyAndValue second ]
						inGroup: #right.
					delay copy wait ] ]
		control: #before
		instance: (operands at: #right)
		methodName: #value:value:
		selector: #value:
		arguments: #(arguments).
	associationsConfig := MethodConfig
		block: [ :bl | 
			"bl is an array of args which contains only the block sent to keysAndValuesDo:"
			Transcript
				show: 'got to keysAndValuesDo: config';
				cr.
			self
				addLinks:
					{(assocBlockConfigBefore getLinkTo: bl first).
					(assocBlockConfigAfter getLinkTo: bl first)} ]
		instance: (operands at: #right)
		methodName: #keysAndValuesDo:
		selector: #value:
		arguments: #(arguments).
	rootConfig := (MethodConfig
		block: [ :rightTree | 
			Transcript
				show: 'got to root config ' , rightTree asString;
				cr.
			associationsConfig
				oneShot;
				getLinkTo: rightTree first ]
		instance: (operands at: #left)
		methodName: #merge:
		selector: #value:
		arguments: #(arguments)) oneShot.
	"subtree of the receiver tree - next configs update the view and recursively set links on their instances"
	"first subtree assignment - either parent's value by key or a tree value by key"
	subtreeConfigFirst := ASTConfig
		block: [ :val | 
			Transcript
				show: 'got to subtree assign ' , val asString;
				cr.
			self updateLeft.
			delay copy wait ]
		control: #after
		instance: (operands at: #left)
		when: #write
		selector: #value:
		arguments: #(context)
		ast:
			(self class objectType >> operation) ast statements first arguments
				first statements first arguments first statements first.
	"second subtree assignment - if we have a non-tree element at that key"
	subtreeConfigSecond := (ASTConfig copyFrom: subtreeConfigFirst)
		ast:
			subtreeConfigFirst ast parent statements second arguments first
				statements first.
	subtreeMerge := (ASTConfig copyFrom: subtreeConfigFirst)
		ast: subtreeConfigFirst ast parent statements third;
		block: [ :ctx | 
			| subtree |
			subtree := ctx tempNamed: #subtree.
			Transcript
				show: 'got to sub merge ' , subtree asString;
				cr.
			self
				addLinks:
					{(subtreeConfigFirst getLinkTo: subtree).
					(subtreeConfigSecond getLinkTo: subtree).
					((MethodConfig copyFrom: rootConfig) getLinkTo: subtree)} ];
		control: #before;
		arguments: #(context).
	^ {rootConfig.
	subtreeConfigFirst.
	subtreeConfigSecond.
	subtreeMerge}