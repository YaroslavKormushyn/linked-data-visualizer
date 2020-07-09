as yet unclassified
getComposer
	| composer |
	composer := RTComposer new.
	composer view: composer view @ RTZoomableView.
	composer gap: 35.
	^ composer