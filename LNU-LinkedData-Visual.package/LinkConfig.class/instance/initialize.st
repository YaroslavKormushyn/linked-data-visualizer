initialization
initialize
	operControls := #(#before #after #instead #onError).
	varControls := #(#write #read #both).
	selector := #value.
	when := #both.
	linkOptionsConfigBlocks := OrderedCollection new