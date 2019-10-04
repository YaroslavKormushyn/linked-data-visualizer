testing
hasDefinedSymbol: aSymbol
	^ (self class methods
		collect: [ :msg | (msg name substrings: '#') second ])
		includes: aSymbol