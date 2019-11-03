generate - shapes
getDefaultHeaderElementShape
	| box valueLabel |
	box := RTBox new
		color: (colors at: #header);
		size: elementSize.
	valueLabel := RTLabel new
		text: 'H';
		color: (colors at: #label).
	^ RTCompositeShape new
		add: box;
		add: valueLabel;
		yourself