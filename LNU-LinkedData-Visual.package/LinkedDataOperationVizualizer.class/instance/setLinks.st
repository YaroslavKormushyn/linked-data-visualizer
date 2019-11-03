initialization
setLinks
	metaLinks := linkMessageConfigs  collect: [:config | config getLink ]