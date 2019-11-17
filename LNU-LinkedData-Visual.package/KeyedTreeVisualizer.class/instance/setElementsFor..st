initialization
setElementsFor: nodes
	| elements |
	elements := RTGroup new.
	nodes
		do: [ :node | 
			(node source isKindOf: KeyedTree)
				ifTrue: [ elements add: ((shapes at: #header) elementOn: node) ]
				ifFalse: [ elements add: ((shapes at: #data) elementOn: node) ] ].
			^ elements