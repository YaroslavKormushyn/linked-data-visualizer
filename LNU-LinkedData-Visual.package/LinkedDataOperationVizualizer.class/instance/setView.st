initialization
setView
operands keysAndValuesDo: [ :key :value |
	self display: value.
	composer group: key.
	 ].