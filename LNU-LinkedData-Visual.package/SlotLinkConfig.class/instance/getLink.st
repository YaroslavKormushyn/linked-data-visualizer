as yet unclassified
getLink
	| link |
	link := super getLink.
	instance
		perform: self metaLinkMessage
		withArguments:
			{link.
			slotName.
			when}.
	^ link