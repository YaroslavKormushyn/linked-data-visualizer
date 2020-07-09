*LNU-Roassal-Extensions
move: name1 between: name2 and: name3
	| g1 g2 g3 |
	g1 := self groupWithoutNest: (mapping at: name1).
	g2 := self groupWithoutNest: (mapping at: name2).
	g3 := self groupWithoutNest: (mapping at: name3).
	TRConstraint move: g1 between: g2 and: g3