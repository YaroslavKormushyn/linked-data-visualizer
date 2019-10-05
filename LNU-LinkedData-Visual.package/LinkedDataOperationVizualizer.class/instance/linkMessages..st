accessing
linkMessages: messageConfigs
	linkMessageConfigs := messageConfigs collect: [ :msg | msg asSymbol ]