as yet unclassified
withAll: aCollection
	^ (self new 
		rows: aCollection size 
		columns: (aCollection detectMax: [ :element | element size ]) size) 
	withAll: aCollection