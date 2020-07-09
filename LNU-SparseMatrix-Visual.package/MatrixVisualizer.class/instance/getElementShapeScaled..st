private
getElementShapeScaled: scale
	| comp box valueLabel indexLabel |
	comp := RTCompositeShape new.
	box := RTBox new
		color: Color blue;
		size: elementSize * scale.
	valueLabel := RTLabel new
	height: RTLabel defaultFontSize * scale;
		text: [ :el | el value ];
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