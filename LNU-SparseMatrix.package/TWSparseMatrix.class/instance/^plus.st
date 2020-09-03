arithmetic
+ aMatrix
	"Addition of matrices of the same type"

	| result rowNumbers colNumbers colLast leftRowMarker rightRowMarker tail |
	(rowNumber = aMatrix rowNumber
		and: [ columnNumber = aMatrix columnNumber ])
		ifFalse: [ Error signal: 'Matrices must be of same size.' ].
	result := self class rows: rowNumber columns: columnNumber.

	"Filter out the rows and columns that don't have elements"
	rowNumbers := ((rows
		reject: [ :rowHead | rowHead rightNeighbour isNil ])
		collect: [ :rowHead | rowHead row ])
		union:
			((aMatrix rows reject: [ :rowHead | rowHead rightNeighbour isNil ])
				collect: [ :rowHead | rowHead row ]).
	colNumbers := ((columns
		reject: [ :colHead | colHead belowNeighbour isNil ])
		collect: [ :colHead | colHead column ])
		union:
			((aMatrix columns reject: [ :colHead | colHead belowNeighbour isNil ])
				collect: [ :colHead | colHead column ]).

	"Initialize an array that has all the last elements in columns"
	colLast := result columns
		select: [ :colHead | colNumbers includes: colHead column ].

	"loop through each row"
	rowNumbers
		do: [ :rowIndex | 
			leftRowMarker := (rows at: rowIndex) rightNeighbour.
			rightRowMarker := (aMatrix rows at: rowIndex) rightNeighbour.
			tail := result rows at: rowIndex.
			[ leftRowMarker column ~= 0 and: [ rightRowMarker column ~= 0 ] ]
				whileTrue: [ leftRowMarker column < rightRowMarker column
						ifTrue: [ tail
								rightNeighbour:
									(TWSparseMatrixNode
										row: rowIndex
										column: leftRowMarker column
										value: leftRowMarker value).
							leftRowMarker := leftRowMarker rightNeighbour ]
						ifFalse: [ leftRowMarker column > rightRowMarker column
								ifTrue: [ "if there's an element on the same index"
									tail
										rightNeighbour:
											(TWSparseMatrixNode
												row: rowIndex
												column: rightRowMarker column
												value: rightRowMarker value).
									rightRowMarker := rightRowMarker rightNeighbour ]
								ifFalse: [ rightRowMarker value + leftRowMarker value = 0
										ifFalse: [ tail
												rightNeighbour:
													(TWSparseMatrixNode
														row: rowIndex
														column: rightRowMarker column
														value: rightRowMarker value + leftRowMarker value) ].
									rightRowMarker := rightRowMarker rightNeighbour.
									leftRowMarker := leftRowMarker rightNeighbour ] ].
					tail rightNeighbour isNotNil
						ifTrue: [ tail := tail rightNeighbour ] ].

			"gather leftovers from left matrix"
			[ leftRowMarker column ~= 0 ]
				whileTrue: [ tail
						rightNeighbour:
							(TWSparseMatrixNode
								row: rowIndex
								column: leftRowMarker column
								value: leftRowMarker value).
					leftRowMarker := leftRowMarker rightNeighbour.
					tail := tail rightNeighbour ].

			"gather leftovers from right matrix"
			[ rightRowMarker column ~= 0 ]
				whileTrue: [ tail
						rightNeighbour:
							(TWSparseMatrixNode
								row: rowIndex
								column: rightRowMarker column
								value: rightRowMarker value).
					rightRowMarker := rightRowMarker rightNeighbour.
					tail := tail rightNeighbour ].

			"close loop the row"
			tail rightNeighbour: (result rows at: rowIndex).
			"shift last elements in columns up-to-down"
			tail := (result rows at: rowIndex) rightNeighbour.
			[ tail column ~= 0 ]
				whileTrue: [ (colLast at: tail column) belowNeighbour: tail.
					tail := tail rightNeighbour ] ].
	"close loop on the columns"
	colLast
		do: [ :colLastElement | 
			colLastElement
				belowNeighbour: (result columns at: colLastElement column) ].
	^ result