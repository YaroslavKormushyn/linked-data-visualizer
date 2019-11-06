accessing
instance: anInstance
anInstance ifNotNil: [ instance := anInstance ] ifNil: [ Error signal: 'Instance mustn''t be nil.' ]
	 