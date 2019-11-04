as yet unclassified
getLink
	| metaLink |
	metaLink := MetaLink new.
	metaLink selector: selector.
	
	arguments ifNotNil: [metaLink arguments: arguments].
	metaLink control: control.
	linkOptionsConfigBlocks
		do: [ :configBlock | configBlock value: metaLink ].
	^ metaLink