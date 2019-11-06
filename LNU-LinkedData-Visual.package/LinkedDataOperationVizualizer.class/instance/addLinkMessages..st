accessing
addLinkMessages: messages
	messages isCollection
		ifFalse: [ Error signal: 'You should add messages to a collection.' ].
	messages isEmpty
		ifTrue: [ Error signal: 'No messages in collection.' ].
	linkConfigs addAll: (messages collect: [ :msg | msg asSymbol ])