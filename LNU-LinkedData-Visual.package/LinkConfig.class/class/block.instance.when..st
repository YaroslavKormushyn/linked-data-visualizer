as yet unclassified
block: aBlock instance: anInstance when: controlAndWhen
	"simplify instance creation - controlAndWhen is a collection of {control when}"

	^ self
		block: aBlock
		control: controlAndWhen first
		instance: anInstance
		when: controlAndWhen second
		selector: nil
		arguments: nil