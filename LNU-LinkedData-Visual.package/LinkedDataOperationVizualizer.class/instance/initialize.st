initialization
initialize
	metaLinks := OrderedCollection new.
	semaphore := Semaphore new.
	composer := RTComposer new.
	context := RTEmptyViewContext new.
	composer view attributeAt: #GlamourContext put: context.
	delay := Delay forSeconds: 1