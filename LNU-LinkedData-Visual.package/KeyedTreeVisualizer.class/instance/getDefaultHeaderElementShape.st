generate - shapes
getDefaultHeaderElementShape
	| box keyLabel |
	box := RTBox new
		color: (colors at: #header);
		size: elementSize.
	keyLabel := RTLabel new
		text: [ :el | el key ];
		color: (colors at: #label).
	^ RTCompositeShape new
		add: box;
		add: keyLabel;
		yourself