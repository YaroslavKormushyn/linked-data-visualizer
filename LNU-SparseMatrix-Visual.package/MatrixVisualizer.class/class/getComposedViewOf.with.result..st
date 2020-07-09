as yet unclassified
getComposedViewOf: leftMatrix with: rightMatrix result: resultMatrix
	| composer |
	composer := self getComposer.
	self on: leftMatrix withView: composer view.
	composer group: #left.
	"add result and new right matrices to the view and update the view"
	MatrixVisualizer on: rightMatrix withView: composer view.
	composer group: #right.
	MatrixVisualizer on: resultMatrix withView: composer view.
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