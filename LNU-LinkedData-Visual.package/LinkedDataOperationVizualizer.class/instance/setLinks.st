initialization
setLinks
	metaLinks := (linkConfigs collect: [ :config | config getLink ]) asOrderedCollection 