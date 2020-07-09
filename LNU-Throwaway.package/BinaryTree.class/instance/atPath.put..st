accessing
atPath: path put: value
|element|
path isEmpty ifTrue: [ ^ self ].
element := self.	
	path allButLastDo: [ :k | element := element at: k ifAbsentPut: [self species new ]].
	^ element at: path last put: (BinaryTreeNode with: value)
