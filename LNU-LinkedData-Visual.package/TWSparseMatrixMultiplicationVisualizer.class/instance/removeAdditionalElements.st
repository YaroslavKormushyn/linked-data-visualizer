removing
removeAdditionalElements
|additionalElementKeys|
additionalElementKeys:=	#(#nowProcessing #newElementValue #leftMarker #rightMarker).
	additionalElementKeys
		do: [ :groupName | 
			(composer hasGroup: groupName)
				ifTrue: [ composer removeGroup: groupName ] ].
			namedGroups := namedGroups copyWithoutAll: additionalElementKeys 