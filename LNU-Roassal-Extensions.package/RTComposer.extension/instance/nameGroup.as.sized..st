*LNU-Roassal-Extensions
nameGroup: aName as: title sized: height
	| label |
	label := (RTLabel new text: title; height: height) element.
	TRConstraint move: label above: (mapping at: aName).
	view add: label.

	"store a reference to the created element"
	names add: label.
	^ label