as yet unclassified
command: aCommand control: aControl instance: anInstance linkType: aLinkType when: whenControl
	"check for command contain"
	| newLinkType |
	(operControls contains: aControl)
		ifFalse: [ Error signal: 'Invalid operation control: ' , aControl asString ].
	(varControls contains: whenControl)
		ifFalse: [ Error signal: 'Invalid variable control: ' , whenControl asString ].
	anInstance isNil
		ifTrue: [ Error signal: 'Binding instance cannot be nil.' ].
		(aLinkType isKindOf: LinkType)
		ifFalse: [ (LinkType hasDefinedSymbol: aLinkType) ifFalse: [ Error signal: 'Unknown link type: ', aLinkType asString ]. newLinkType := LinkType perform: aLinkType ]
	.(LinkType hasDefined: aLinkType)
	ifTrue: [ newLinkType := aLinkType ]
		ifFalse: [ Error signal: 'Unknown link type: ' , aLinkType value asString ]