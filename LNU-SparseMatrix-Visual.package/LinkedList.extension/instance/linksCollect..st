*LNU-SparseMatrix-Visual
linksCollect: aBlock
	| aLink newCollection|
	aLink := firstLink.
	newCollection := self class new.
	[ aLink == nil ]
		whileFalse: [ newCollection add: (aBlock value: aLink).
			aLink := aLink nextLink ].
	^ newCollection