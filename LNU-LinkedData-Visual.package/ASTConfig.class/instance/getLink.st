as yet unclassified
getLink
	| link |
	link := self getLinkBase.
	instance
		perform: self metaLinkMessage
		withArguments:
			{link.
			ast}.
	^ link