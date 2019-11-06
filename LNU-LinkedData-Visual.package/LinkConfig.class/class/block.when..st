as yet unclassified
block: aBlock when: controlAndWhen
	"simplify instance creation - controlAndWhen is a collection of {control when}
	without instance it's an empty template of a link, which should have instance eventually"

	^ self
		block: aBlock
		control: controlAndWhen first
		instance: nil
		when: controlAndWhen second
		selector: nil
		arguments: nil