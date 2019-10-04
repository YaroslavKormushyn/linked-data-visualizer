as yet unclassified
getDefaultDataElementShape
	| box valueLabel indexLabel |
	box := RTBox new
		color: (colors at: #data);
		size: elementSize.
	valueLabel := RTLabel new
		text: [ :el | 
			el value isNil
				ifTrue: 0
				ifFalse: [ el value ] ];
		color: (colors at: #label).
	indexLabel := RTLabel new
		height: elementSize / 5;
		text: [ :el | 
			| row col |
			row := el row.
			col := el column.
			row isNil
				ifTrue: [ row := 0 ].
			col isNil
				ifTrue: [ col := 0 ].
			row @ col ];
		color: (colors at: #label).
	^ RTCompositeShape new
		add: box;
		add: valueLabel;
		add: indexLabel translateBy: 0 @ 10