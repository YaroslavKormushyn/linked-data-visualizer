initialization
initialize
	metaLinks := OrderedCollection new.
	semaphore := Semaphore new.
	composer := RTComposer new.
	delay := Delay forSeconds: 0.2