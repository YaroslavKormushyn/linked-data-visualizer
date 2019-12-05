accessing
linkMessages: messageConfigs
	linkConfigs := messageConfigs collect: [ :msg | msg asSymbol ]