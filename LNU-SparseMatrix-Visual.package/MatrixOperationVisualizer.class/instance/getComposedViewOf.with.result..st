deprecated - compatibility layer
getComposedViewOf: left with: right result: result
	MatrixVisualizer on: left withView: composer view.
	composer group: #left.
	"add result and new right matrices to the view and update the view"
	MatrixVisualizer on: right withView: composer view.
	composer group: #right.
	MatrixVisualizer on: result withView: composer view.
	composer group: #result.
	composer move: #left onTheLeftOf: #right.
	composer move: #result onTheRightOf: #right.
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #right.
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #left.
	composer
		setBackgroundColor: (Color gray alpha: 0.2)
		forGroup: #result.
	composer nameGroup: #left as: 'left'.
	composer nameGroup: #right as: 'right'.
	composer nameGroup: #result as: 'result'.
	composer group: #labels.
	^ composer