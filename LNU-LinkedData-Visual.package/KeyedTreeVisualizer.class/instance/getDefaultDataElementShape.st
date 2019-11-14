generate - shapes
getDefaultDataElementShape
	| box valueLabel keyLabel |
	box := RTEllipse new
		color: (colors at: #data);
		size: elementSize.
	valueLabel := RTLabel new
		text: [ :el | el value ];
		color: (colors at: #label).
	keyLabel := RTLabel new
		text: [ :el | el key ];
		color: (colors at: #label).
	^ RTCompositeShape new
		add: box;
		add: keyLabel;
		add: valueLabel translateBy: 0 @ 10;
		yourself