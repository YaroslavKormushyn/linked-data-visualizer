instance creation
withAll: aCollection
	rows := Array new: aCollection size.
	rowNumber := aCollection size.
	columnNumber := (aCollection detectMax: [ :array | array size ]) size.
	1 to: rowNumber do: [ :index | rows at: index put: (Array new: columnNumber )].
	1 to: rowNumber do: [ :rowIndex | 
		1 to: columnNumber do: [ :columnIndex | 
			(rows at: rowIndex ) 
				at: columnIndex 
				put: ((aCollection at: rowIndex ) 
							at: columnIndex) ] ]
	