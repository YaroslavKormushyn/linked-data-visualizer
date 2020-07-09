initialization
setMultiLinksForRightMatrixOn: matrixInstance inMethod: methodName
	| transposedRightMatrixLink |
	"reset the right matrix according to the algorithm in the method"
	transposedRightMatrixLink := MetaLink new.
	transposedRightMatrixLink
		metaObject: [ :value | rightMatrix := value ].
	transposedRightMatrixLink selector: #value:.
	transposedRightMatrixLink arguments: #(value).
	transposedRightMatrixLink control: #after.
	matrixInstance
		link: transposedRightMatrixLink
		toTemporaryNamed: #transposed
		inMethod: methodName
		option: #write.
	metaLinks add: transposedRightMatrixLink