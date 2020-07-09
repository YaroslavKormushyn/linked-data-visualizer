accessing
at: k ifAbsentPut: aBlock
[(self children collect: [ :kid | kid key ]) includes: k]
ifTrue: [ ^ self at: k ] ifFalse: [ ^self at: k put: aBlock value ]