as yet unclassified
getLink
	| link |
	link := super getLinkBase.
	instance
		perform: self metaLinkMessage
		withArguments:
			{link.
			slotName.
			when}.
	^ link