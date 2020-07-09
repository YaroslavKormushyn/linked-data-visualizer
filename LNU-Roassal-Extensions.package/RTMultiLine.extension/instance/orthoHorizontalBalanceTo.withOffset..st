*LNU-Roassal-Extensions
orthoHorizontalBalanceTo: balance withOffset: offset
	"0 = level of fromPoint
	 0.5 = middle
	 1 = level of toPoint
	 offset = Number to add to x"

	self
		block: [ :fromPoint :toPoint | 
			| midx |
			midx := toPoint x * balance + (fromPoint x * (1 - balance)) + offset.
			Array
				with: fromPoint
				with: midx @ fromPoint y
				with: midx @ toPoint y
				with: toPoint ]