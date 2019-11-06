initialization
initialize
	namedGroups := #(#left #result #right #leftMarker #rightMarker).
	backgroundGroups := #(#left #result #right).
	metaLinks := OrderedCollection new.
	semaphore := Semaphore new.
	composer := RTComposer new.
	delay := Delay new