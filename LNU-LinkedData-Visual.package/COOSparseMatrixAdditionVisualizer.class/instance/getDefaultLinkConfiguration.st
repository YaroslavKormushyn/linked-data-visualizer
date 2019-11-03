as yet unclassified
getDefaultLinkConfiguration
	"Set links for result matrix update on viewer"
	^{
	TempVarLinkConfig commandBlock: ["hella lot of code"] control: #after instance: (operands at: #left) methodName: #+ tempVarName: #result when: #write metaObjectSelector: #value metaObjectArguments: #(value)
	}
	