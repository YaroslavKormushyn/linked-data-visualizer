generate - shapes
getDefaultDataElementShape
	| box valueLabel indexLabel |
	box := RTBox new
		color: (colors at: #data);
		size: elementSize.
	valueLabel := RTLabel new
		text: [ :el | 
			el value isNil
				ifTrue: 0
				ifFalse: [ el value value ] ];
		color: (colors at: #label).
	indexLabel := RTLabel new
		height: elementSize / 5;
		text: [ :elLink | 
			| col |
			col := elLink value column.
			col isNil
				ifTrue: [ col := 0 ].
			'col: ' , col asString ];
		color: (colors at: #label).
	^ RTCompositeShape new
		add: box;
		add: valueLabel;
		add: indexLabel translateBy: 0 @ 10