testing
isEmpty
	^ (rows allSatisfy: [ :el | el rightNeighbour = el ]) 
		and: [ columns allSatisfy: [ :el | el belowNeighbour = el ] ]
