initialization
initialize
	linkMessageConfigs := #(#next #previous).
	namedGroups := #(#left #result #right #leftMarker #rightMarker).
	backgroundGroups := #(#left #result #right).
	metaLinks := OrderedCollection new.
	semaphore := Semaphore new.
	namedGroups := {}.
	backgroundGroups := {}.
	composer := RTComposer new.
	delay := Delay new.