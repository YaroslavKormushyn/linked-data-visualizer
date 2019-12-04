initialization
setPositions
	composer move: #sourceMarker below: #source.
	composer move: #result onTheRightOf: #source.
	composer nameGroup: #sourceMarker as: 'sourceMarker'.
	composer nameGroup: #source as: 'source'.
	composer nameGroup: #result as: 'result'.
	composer
		setBackgroundColor: (Color gray alpha: 0.2)
		forGroup: #source.
		composer
		setBackgroundColor: (Color gray alpha: 0.2)
		forGroup: #result.
	composer group: #labels