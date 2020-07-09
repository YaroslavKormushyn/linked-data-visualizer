*LNU-Roassal-Extensions
orthoVerticalBalancedToRightWithOffset: offset
	self
		block: [ :fromPoint :toPoint | 
			| midy |
			midy := {toPoint y.
			fromPoint y} max + offset.
			Array
				with: fromPoint
				with: fromPoint x @ midy
				with: toPoint x @ midy
				with: toPoint ]