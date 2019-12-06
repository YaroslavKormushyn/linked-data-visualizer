removing
removeAdditionalElements
	#(#nowProcessing #newElementValue #leftMarker #rightMarker) do: [ :groupName | (composer hasGroup: groupName) ifTrue: [ composer removeGroup: groupName ] ]