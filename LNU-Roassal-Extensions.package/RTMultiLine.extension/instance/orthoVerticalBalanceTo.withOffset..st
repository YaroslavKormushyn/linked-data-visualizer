*LNU-Roassal-Extensions
orthoVerticalBalanceTo: balance withOffset: offset
	"0 = level of fromPoint
	 0.5 = middle
	 1 = level of toPoint
	offset = Number to add to mid y"

	self
		block: [ :fromPoint :toPoint | 
			| midy |
			midy := toPoint y * balance + (fromPoint y * (1 - balance)) + offset.
			Array
				with: fromPoint
				with: fromPoint x @ midy
				with: toPoint x @ midy
				with: toPoint ]