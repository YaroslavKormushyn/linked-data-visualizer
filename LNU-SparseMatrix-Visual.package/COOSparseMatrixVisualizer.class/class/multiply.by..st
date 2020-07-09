as yet unclassified
multiply: leftMatrix by: rightMatrix
	| composer innerContext |
	composer := RTComposer new.
	composer gap: 35.
	MatrixVisualizer on: leftMatrix withView: composer view.
	composer group: #left.
	MatrixVisualizer on: rightMatrix withView: composer view.
	composer group: #right.
	composer move: #left onTheLeftOf: #right.
	composer nameGroup: #left as: 'left'.
	composer nameGroup: #right as: 'second'.
	
	innerContext := [ leftMatrix * rightMatrix ].
	
	^ composer view