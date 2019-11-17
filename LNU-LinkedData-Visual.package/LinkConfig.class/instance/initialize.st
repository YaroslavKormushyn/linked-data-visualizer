initialization
initialize
	operControls := #(#before #after #instead #onError).
	varControls := #(#write #read #both).
	selector := #value.
	when := #both.
	control := #before.
	linkOptionsConfigBlocks := OrderedCollection new