generate - shapes
getDefaultDataElementShape
	| box valueLabel |
	box := RTBox new
		color: (colors at: #data);
		size: elementSize.
	valueLabel := RTLabel new
		text: [ :el | 
			el value isNil
				ifTrue: 0
				ifFalse: [ el value ] ];
		color: (colors at: #label).
	^ RTCompositeShape new
		add: box;
		add: valueLabel;
		yourself