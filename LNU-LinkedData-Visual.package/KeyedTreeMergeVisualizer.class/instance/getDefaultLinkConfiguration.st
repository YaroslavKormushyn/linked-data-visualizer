as yet unclassified
getDefaultLinkConfiguration
	^ (self getOperandsLinkConfiguration,
	self getViewUpdateLinkConfiguration) asOrderedCollection 