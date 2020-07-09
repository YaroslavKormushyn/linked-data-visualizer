initialization
initializeAdditionView
	namedGroups := #(#left #result #right #leftMarker #rightMarker).
	backgroundGroups := #(#left #result #right).
	MatrixVisualizer on: leftMatrix withView: composer view.
	composer group: #left.
	MatrixVisualizer on: rightMatrix withView: composer view.
	composer group: #right.
	MatrixVisualizer on: resultMatrix withView: composer view.
	composer group: #result.
	self add: nowProcessingElementIndex.
	self group: #nowProcessing.
	self add: leftMarkerElement.
	self group: #leftMarker.
	self add: rightMarkerElement.
	self group: #rightMarker.
	self
		selectModels:
			{leftMarkerElement model.
			rightMarkerElement model}