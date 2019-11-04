initialization
initialize
	operControls := #(#before #after #instead #onError).
	varControls := #(#write #read #both).
	selector := #value.
	control := #all.
	linkOptionsConfigBlocks := OrderedCollection new