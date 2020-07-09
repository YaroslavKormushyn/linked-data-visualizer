private
getElementShape
	| comp box valueLabel indexLabel |
	comp := RTCompositeShape new.
	box := RTBox new
		color: Color blue;
		size: elementSize.
	valueLabel := RTLabel new
		text: [ :el | el value isNil ifTrue:  0  ifFalse: [el value] ];
		color: Color white.
	indexLabel := RTLabel new
		height: 5;
		text: [ :el | 
			| row col |
			row := el row.
			col := el column.
			row isNil
				ifTrue: [ row := 0 ].
			col isNil
				ifTrue: [ col := 0 ].
			row @ col ];
		color: Color white.
	comp
		add: box;
		add: valueLabel;
		add: indexLabel translateBy: 0 @ 10.
	^ comp