as yet unclassified
getLink
	| link |
	link := super getLinkBase.
	instance
		perform: self metaLinkMessage
		withArguments:
			{link.
			methodName}.
	^ link