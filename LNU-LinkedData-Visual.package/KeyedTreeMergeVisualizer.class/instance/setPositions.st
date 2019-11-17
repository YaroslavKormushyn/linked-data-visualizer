initialization
setPositions
	composer move: #left onTheLeftOf: #right.
	"composer move: #leftMarker below: #left.
	composer move: #rightMarker below: #right."
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #right.
	composer setBackgroundColor: (Color gray alpha: 0.2) forGroup: #left.
	composer nameGroup: #left as: 'left'.
	composer nameGroup: #right as: 'right'.
	"composer nameGroup: #leftMarker as: 'left marker'.
	composer nameGroup: #rightMarker as: 'right marker'."
	composer group: #labels