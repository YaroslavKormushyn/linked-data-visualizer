*LNU-Roassal-Extensions
orthoHorizontalBalancedToBottomWithOffset: offset
	self
		block: [ :fromPoint :toPoint | 
			| midx |
			midx := { toPoint x . fromPoint x } max + offset.
			Array
				with: fromPoint
				with: midx @ fromPoint y
				with: midx @ toPoint y
				with: toPoint ]