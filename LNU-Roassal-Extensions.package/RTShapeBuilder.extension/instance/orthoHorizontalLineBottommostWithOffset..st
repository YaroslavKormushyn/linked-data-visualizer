*LNU-Roassal-Extensions
orthoHorizontalLineBottommostWithOffset: offset
	^ self shape: (RTStyledMultiLine new withHorizontalAttachPoint; orthoHorizontalBalancedToBottomWithOffset: offset)