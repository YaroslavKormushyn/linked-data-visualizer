accessing
linkMessages: messageConfigs
	messageConfigs isCollection
		ifFalse: [ Error
				signal: 'You should add message link configurations to a collection.' ].
	messageConfigs isEmpty
		ifTrue: [ Error signal: 'No messages in collection.' ].
	linkMessageConfigs := messageConfigs collect: [ :msg | msg asSymbol ]