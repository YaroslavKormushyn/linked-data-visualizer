initialization
initialize
	gap := 35.
	elementSize := 30.
	colors := Dictionary
		newFrom:
			{(#data -> Color blue).
			(#header -> Color darkGray).
			(#select -> Color red).
			(#highlight -> Color yellow).
			(#label -> Color white)}.
	shapes := Dictionary
		newFrom:
			{(#data -> self getDefaultDataElementShape).
			(#header -> self getDefaultHeaderElementShape).
			(#edgeBuilder -> self getDefaultEdgeShapeBuilder)}.
	linkMessages := #(#next #previous) asSet.
	view := RTView new.
	view @ RTZoomableView