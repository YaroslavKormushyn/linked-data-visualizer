as yet unclassified
getLinkBase
	| metaLink |
	self checkValidity.
	metaLink := MetaLink new.
	metaLink metaObject: block.
	metaLink selector: selector.
	arguments ifNotNil: [ metaLink arguments: arguments ].
	metaLink control: control.
	linkOptionsConfigBlocks
		do: [ :configBlock | configBlock value: metaLink ].
	^ metaLink