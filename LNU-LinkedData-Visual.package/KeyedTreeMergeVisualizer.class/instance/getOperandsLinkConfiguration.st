as yet unclassified
getOperandsLinkConfiguration
	| rootConfig associationsConfig assocBlockConfigAfter assocBlockConfigBefore |
	assocBlockConfigAfter := MethodLinkConfig
		block: [ :keyAndValue | 
			
			keyAndValue second
				ifNotNil: [ composer
						selectUsing: [ :el | el source = keyAndValue second ]
						inGroup: #right ] ]
		control: #after
		instance: (operands at: #right)
		methodName: #value:value:
		selector: #value:
		arguments: #(arguments).
	assocBlockConfigBefore := MethodLinkConfig
		block: [ :keyAndValue | 
			keyAndValue second
				ifNotNil: [ composer
						deselectUsing: [ :el | el source = keyAndValue second ]
						inGroup: #right ] ]
		control: #before
		instance: (operands at: #right)
		methodName: #value:value:
		selector: #value:
		arguments: #(arguments).
	associationsConfig := MethodLinkConfig
		block: [ :bl | 
			"bl is an array of args which contains only the block sent to keysAndValuesDo:"
			assocBlockConfigAfter instance: bl first.
			assocBlockConfigBefore instance: bl first.
			self
				addLinks:
					{assocBlockConfigBefore getLink.
					assocBlockConfigAfter getLink} ]
		control: #after
		instance: (operands at: #right)
		methodName: #keysAndValuesDo:
		selector: #value:
		arguments: #(arguments).
	rootConfig := MethodLinkConfig
		block: [ :rightTree | 
			associationsConfig
				instance: rightTree first;
				oneShot;
				getLink ]
		instance: (operands at: #right)
		methodName: #merge:
		selector: #value:
		arguments: #(arguments).
	^ {rootConfig}