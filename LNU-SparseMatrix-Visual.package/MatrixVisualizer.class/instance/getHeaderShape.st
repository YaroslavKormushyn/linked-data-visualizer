private
getHeaderShape
	| comp box valueLabel indexLabel |
	comp := RTCompositeShape new.
	box := RTBox new
		color: Color green;
		size: elementSize.
	valueLabel := RTLabel new
		text: 'H';
		color: Color white.
	indexLabel := RTLabel new
		height: 5;
		text: [ :el | el row @ el column ];
		color: Color white.
	comp
		add: box;
		add: valueLabel;
		add: indexLabel translateBy: 0 @ 10.
	^ comp