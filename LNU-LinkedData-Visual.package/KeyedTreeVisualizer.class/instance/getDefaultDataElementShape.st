generate - shapes
getDefaultDataElementShape
	| box valueLabel keyLabel |
	box := RTBox new
		color: (colors at: #data);
		size: elementSize.
	valueLabel := RTLabel new
		text: [ :el | el value ];
		height: elementSize / 4;
		color: (colors at: #label).
	"keyLabel := RTLabel new
		text: [ :el | el key ];
		height: elementSize / 5;
		color: (colors at: #label)."
	^ RTCompositeShape new
		add: box;
		"add: keyLabel;"
			add: valueLabel;
		"translateBy: 0 @ 10"
			yourself