private
getHeaderShapeScaled: scale
	| comp box valueLabel indexLabel |
	comp := RTCompositeShape new.
	box := RTBox new
		color: Color green;
		size: elementSize * scale.
	valueLabel := RTLabel new
		height: RTLabel defaultFontSize * scale;
		text: 'H';
		color: Color white.
	indexLabel := RTLabel new
		height: 5 * scale;
		text: [ :el | el row @ el column ];
		color: Color white.
	comp
		add: box;
		add: valueLabel;
		add: indexLabel translateBy: 0 @ (10 * scale).
	^ comp