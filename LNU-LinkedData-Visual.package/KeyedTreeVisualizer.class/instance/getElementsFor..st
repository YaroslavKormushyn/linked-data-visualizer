as yet unclassified
getElementsFor: linkedStructure
	| elements |
	elements := OrderedCollection new.
	elements
		addAll:
			(linkedStructure keys
				flatCollect: [ :k | 
					| el |
					el := linkedStructure at: k.
					(el isKindOf: KeyedTree)
						ifTrue: [ | els |
							els := OrderedCollection new.
							els
								addFirst:
									(KeyedTreeElement new
										key: k;
										source: el).
							els addAll: (self getElementsFor: el).
							els ]
						ifFalse: [ {(KeyedTreeElement new
								key: k;
								source: el;
								value: el)} asOrderedCollection ] ]).
	^ elements