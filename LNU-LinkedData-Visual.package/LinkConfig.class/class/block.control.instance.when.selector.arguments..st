as yet unclassified
block: aCommandBlock control: aControl instance: anInstance when: whenControl selector: selector arguments: args
"this is the sink method - most detailed, all the other convenience methods call this"
	^ self new
		block: aCommandBlock
		control: aControl
		instance: anInstance
		when: whenControl
		selector: selector
		arguments: args