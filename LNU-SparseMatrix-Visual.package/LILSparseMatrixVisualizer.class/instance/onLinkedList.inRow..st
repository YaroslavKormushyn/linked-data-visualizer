instance creation
onLinkedList: aLinkedList inRow: rowIndex
	| elementShape headerShape elements box valueLabel indexLabel headerBox headerValueLabel |
	elementShape := RTCompositeShape new.
	box := RTBox new
		color: Color blue;
		size: elementSize.
	valueLabel := RTLabel new
		text: [ :el | 
			el value isNil
				ifTrue: 0
				ifFalse: [ el value value ] ];
		color: Color white.
	indexLabel := RTLabel new
		height: 5;
		text: [ :elLink | 
			| col |
			col := elLink value column.
			col isNil
				ifTrue: [ col := 0 ].
			rowIndex @ col ];
		color: Color white.
	elementShape
		add: box;
		add: valueLabel;
		add: indexLabel translateBy: 0 @ 10.
	headerShape := RTCompositeShape new.
	headerBox := RTBox new
		color: Color green;
		size: elementSize.
	headerValueLabel := RTLabel new
		text: 'H';
		color: Color white.
	headerShape
		add: headerBox;
		add: headerValueLabel;
		add: indexLabel translateBy: 0 @ 10.
	elements := RTGroup new
		addAll:
			(aLinkedList
				linksCollect: [ :elLink | 
					elLink value column = 0
						ifTrue: [ headerShape elementOn: elLink ]
						ifFalse: [ elementShape elementOn: elLink ] ]);
		yourself.
	elements @ RTDraggable.
	elements @ RTPopup.
	view addAll: elements.
	self
		drawEdgesWith: elements
		connectTo: [ :elLink | 
			elLink nextLink isNotNil
				ifTrue: [ elLink nextLink ] ].
	RTGridLayout on: elements.
	self
		setPositionsFor: elements
		using: [ :e | 
			| gap |
			gap := 10.
			[ :continue | 
			| aNode |
			e model value isNil
				ifTrue: [ continue value ].
			aNode := e model value.
			e translateTo: (elementSize + gap) * (aNode column @ rowIndex) ] valueWithExit ]