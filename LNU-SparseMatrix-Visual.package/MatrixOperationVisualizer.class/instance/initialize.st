initialization
initialize
	composer := RTComposer new.
	composer view: composer view @ RTZoomableView.
	composer gap: 35.
	metaLinks := OrderedCollection new.
	semaphore := Semaphore new.