as yet unclassified
getLink
	| metaLink |
	metaLink := MetaLink new.
	metaLink selector: metaObjectSelector.
	metaLink arguments: metaObjectArguments.
	metaLink control: control.
	instance
		perform: self metaLinkMessage
		withArguments:
			{metaLink.
			methodName}.
	^ metaLink