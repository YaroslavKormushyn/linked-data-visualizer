as yet unclassified
getDefaultLinkConfiguration
	"Set links for result matrix update on viewer"

	^ (self getViewUpdateLinkConfiguration,self getDefaultResultMatrixLinkConfiguration
		, self getDefaultOperandsLinkConfiguration
		) asOrderedCollection