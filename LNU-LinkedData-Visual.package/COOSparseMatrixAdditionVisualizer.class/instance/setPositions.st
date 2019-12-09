initialization
setPositions
	| defaultLabelHeight |
	defaultLabelHeight := TRLabelShape defaultFontSize.
	composer move: #left onTheLeftOf: #right.
	composer move: #result onTheRightOf: #right.
	composer move: #leftMarker below: #left.
	composer move: #rightMarker below: #right.
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #right.
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #left.
	composer
		setBackgroundColor: (Color gray alpha: 0.2)
		forGroup: #result.
	composer
		nameGroup: #left
		as: 'left'
		sized: scale/ 1.5 * defaultLabelHeight.
	composer
		nameGroup: #right
		as: 'right'
		sized: scale/ 1.5 * defaultLabelHeight.
	composer
		nameGroup: #result
		as: 'result'
		sized: scale/ 1.5 * defaultLabelHeight.
	composer
		nameGroup: #leftMarker
		as: 'left marker'
		sized: scale/ 1.5 * defaultLabelHeight.
	composer
		nameGroup: #rightMarker
		as: 'right marker'
		sized: scale/ 1.5 * defaultLabelHeight.
	composer group: #labels