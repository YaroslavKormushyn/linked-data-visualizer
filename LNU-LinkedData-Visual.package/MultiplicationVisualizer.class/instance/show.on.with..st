as yet unclassified
show: operator on: left with: right
	super show: operator on: left with: right.
	self setLinks.
	self setUpMenu.
	^ composer view