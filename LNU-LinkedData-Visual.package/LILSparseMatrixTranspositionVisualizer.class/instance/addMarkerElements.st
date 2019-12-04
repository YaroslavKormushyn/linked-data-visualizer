adding
addMarkerElements
	composer view add: leftMarkerElement.
	composer group: #leftMarker.
	composer view add: rightMarkerElement.
	composer group: #rightMarker.
	composer
		selectModels:
			{leftMarkerElement model.
			rightMarkerElement model}