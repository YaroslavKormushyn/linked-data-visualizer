copying
copyFrom: aLinkConfig
	^ (self
		block: aLinkConfig block
		control: aLinkConfig control
		instance: aLinkConfig instance
		when: aLinkConfig when
		selector: aLinkConfig selector
		arguments: aLinkConfig arguments)
		linkOptionsConfigBlocks: aLinkConfig linkOptionsConfigBlocks