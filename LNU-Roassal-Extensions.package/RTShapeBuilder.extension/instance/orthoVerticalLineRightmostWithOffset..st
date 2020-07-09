*LNU-Roassal-Extensions
orthoVerticalLineRightmostWithOffset: offset
	^ self
		shape:
			(RTStyledMultiLine new
				withVerticallAttachPoint;
				orthoVerticalBalancedToRightWithOffset: offset)