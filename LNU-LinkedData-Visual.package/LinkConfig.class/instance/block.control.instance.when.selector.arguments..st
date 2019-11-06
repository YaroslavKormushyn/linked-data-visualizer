as yet unclassified
block: aCommandBlock control: aControl instance: anInstance when: whenControl selector: aSelector arguments: args
	block := aCommandBlock.
	control := aControl.
	instance := anInstance.
	"default is #both - for compatibility with method config, where no when is needed"
	when := whenControl ifNil: [ when ] ifNotNil: [ whenControl asSymbol].
	"default selector is #value - no public setter"
	selector := aSelector
		ifNil: [ selector ]
		ifNotNil: [ aSelector asSymbol ].
	"default args are nil - no public setter"
	arguments := args
		ifNil: [ nil ]
		ifNotNil: [ args collect: [ :arg | arg asSymbol ] ]