adding
addResultVisualizer
	| resultVisualizer |
	resultVisualizer := LinkedDataVisualizer
		on: (operands at: #result)
		withView: composer view.
	composer group: #result.
	dataVisualizers add: #result -> resultVisualizer