initialization
setPositionsForAddition
	composer move: #left onTheLeftOf: #right.
	composer move: #result onTheRightOf: #right.
	composer move: #leftMarker below: #left.
	composer move: #rightMarker below: #right.
	composer move: #nowProcessing above: #right.
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #right.
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #left.
	composer
		setBackgroundColor: (Color gray alpha: 0.2)
		forGroup: #result.
	composer nameGroup: #left as: 'left'.
	composer nameGroup: #right as: 'right'.
	composer nameGroup: #result as: 'result'.
	composer nameGroup: #leftMarker as: 'left marker'.
	composer nameGroup: #rightMarker as: 'right marker'.
	composer group: #labels