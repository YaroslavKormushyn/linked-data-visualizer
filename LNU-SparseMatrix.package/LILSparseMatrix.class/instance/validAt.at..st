private
validAt: rowIndex at: columnIndex
	^ (rowIndex <= rowNumber) & (rowIndex > 0) & (columnIndex <= columnNumber) & (columnIndex > 0)