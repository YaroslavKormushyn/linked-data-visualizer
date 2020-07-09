initialization
initialize
	super initialize.
	currentLeftRow := currentRightColumn := 0.
	nowProcessingElementIndex := (RTLabel
		text:
			[ :indices | 'Now processing ' , (indices first @ indices last) asString ])
		elementOn:
			{currentLeftRow.
			currentRightColumn}