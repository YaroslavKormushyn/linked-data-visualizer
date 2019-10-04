generate - shapes
getDefaultHeaderElementShape
| box valueLabel indexLabel |
	box := RTBox new
		color: (colors at: #header);
		size: elementSize.
	valueLabel := RTLabel new
		text: 'H';
		color: (colors at: #label).
	indexLabel := RTLabel new
		height: elementSize / 5;
		text: [ :el | el row @ el column ];
		color: (colors at: #label).
	^ RTCompositeShape new
		add: box;
		add: valueLabel;
		add: indexLabel translateBy: 0 @ 10.