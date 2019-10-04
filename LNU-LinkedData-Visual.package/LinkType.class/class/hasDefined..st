testing
hasDefined: aLinkType
	^ (self class methods
		collect: [ :msg | (msg name substrings: '#') second ])
		includes: aLinkType value