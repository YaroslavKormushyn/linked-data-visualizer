removing
removeLink: metaLink
	metaLinks
		detect: [ :link | link = metaLink ]
		ifFound: [ :link | 
			link uninstall.
			metaLinks remove: metaLink ]