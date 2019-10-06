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
	metaLinks := OrderedCollection new.
	delay := Delay new.
	semaphore := Semaphore new