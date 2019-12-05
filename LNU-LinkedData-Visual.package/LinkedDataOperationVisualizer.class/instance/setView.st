initialization
setView
	operands
		keysAndValuesDo: [ :key :value | 
			(dataVisualizers at: key) on: value.
			composer group: key ]