adding
addLinkMessages: messages
	linkMessages addAll: (messages collect: [ :msg | msg asSymbol ])